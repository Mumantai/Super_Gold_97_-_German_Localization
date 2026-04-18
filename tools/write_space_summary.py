#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Usage examples:

  # Auto-find all scripts.asm files
  python3 tools/write_space_summary.py pokegold.map

  # Restrict to one file (backward-compatible style)
  python3 tools/write_space_summary.py pokegold.map data/maps/scripts.asm

  # Custom globs
  python3 tools/write_space_summary.py pokegold.map --scripts-glob "**/scripts.asm"
  python3 tools/write_space_summary.py pokegold.map --scripts-glob "**/scripts.asm" --scripts-glob "**/*scripts*.asm"

Outputs markdown suitable for GitHub Actions summary:
- ROM bank
  - sections in that bank
    - files in each section (estimated by first global labels)
"""

from __future__ import annotations

import argparse
import re
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Optional, Tuple

from mapreader import MapReader


SECTION_RE = re.compile(r'^\s*SECTION\s+"([^"]+)",\s*ROMX\b')
INCLUDE_RE = re.compile(r'^\s*INCLUDE\s+"([^"]+)"')
GLOBAL_LABEL_RE = re.compile(r'^\s*([A-Za-z_][A-Za-z0-9_]*)\s*::?')

ROM_BANK_SIZE = 0x4000


@dataclass
class FileReport:
    include_path: str
    label: str
    start: int
    end: int
    size: int


@dataclass
class SectionReport:
    source_scripts: str
    section_name: str
    bank_no: int
    section_start: int
    section_end: int
    files: List[FileReport]

    @property
    def section_size(self) -> int:
        return self.section_end - self.section_start + 1


@dataclass
class BankReport:
    bank_no: int
    total: int
    used: int
    free: int
    sections: List[SectionReport]


def fmt_bytes(value: int) -> str:
    return f"{value} B (0x{value:04X})"


def resolve_path(base: Path, p: str) -> Path:
    path = Path(p)
    return path if path.is_absolute() else base / path


def find_scripts_files(repo_root: Path, patterns: List[str]) -> List[Path]:
    seen = set()
    out: List[Path] = []
    for pattern in patterns:
        for p in sorted(repo_root.glob(pattern)):
            if p.is_file() and p.suffix.lower() == ".asm":
                rp = p.resolve()
                if rp not in seen:
                    seen.add(rp)
                    out.append(rp)
    return out


def parse_scripts_file(path: Path, repo_root: Path) -> List[dict]:
    sections: List[dict] = []
    current: Optional[dict] = None
    source_rel = path.relative_to(repo_root).as_posix()

    for raw in path.read_text(encoding="utf-8").splitlines():
        line = raw.strip()

        m_sec = SECTION_RE.match(line)
        if m_sec:
            if current is not None:
                sections.append(current)
            current = {
                "name": m_sec.group(1),
                "includes": [],
                "source_scripts": source_rel,
            }
            continue

        if current is None:
            continue

        m_inc = INCLUDE_RE.match(line)
        if m_inc:
            current["includes"].append(m_inc.group(1))

    if current is not None:
        sections.append(current)

    return sections


def first_global_label(path: Path) -> Optional[str]:
    if not path.exists():
        return None

    for raw in path.read_text(encoding="utf-8").splitlines():
        code = raw.split(";", 1)[0].rstrip()
        if not code.strip():
            continue
        if code.lstrip().startswith("."):
            continue

        m = GLOBAL_LABEL_RE.match(code)
        if m:
            return m.group(1)

    return None


def load_reader(map_path: Path) -> MapReader:
    reader = MapReader()
    reader.read_map_data(map_path.read_text(encoding="utf-8").splitlines())
    return reader


def detect_rom_banked_type(reader: MapReader) -> Optional[str]:
    # 1) Prefer explicit ROMX key
    if reader.bank_data.get("ROMX"):
        return "ROMX"

    # 2) Look for banked type with ROM-ish name
    for t_name, t_info in reader.bank_types.items():
        if not t_info.get("banked", False):
            continue
        if "ROM" in t_name.upper() and reader.bank_data.get(t_name):
            return t_name

    # 3) Fallback: any banked type with data
    for t_name, t_info in reader.bank_types.items():
        if t_info.get("banked", False) and reader.bank_data.get(t_name):
            return t_name

    return None


def build_map_indexes(reader: MapReader, rom_type: str) -> Tuple[Dict[str, dict], Dict[str, List[dict]], Dict[int, dict]]:
    section_by_name: Dict[str, dict] = {}
    symbol_index: Dict[str, List[dict]] = {}
    bank_index: Dict[int, dict] = {}

    bank_group = reader.bank_data.get(rom_type, {})
    for bank_no, bank_data in bank_group.items():
        bank_index[bank_no] = bank_data
        for section in bank_data.get("sections", []):
            section_by_name.setdefault(
                section["name"],
                {
                    "bank_no": bank_no,
                    "beg": section["beg"],
                    "end": section["end"],
                    "symbols": section.get("symbols", []),
                },
            )
            for sym in section.get("symbols", []):
                symbol_index.setdefault(sym["name"], []).append(
                    {
                        "address": sym["address"],
                        "bank_no": bank_no,
                        "section_name": section["name"],
                        "section_beg": section["beg"],
                        "section_end": section["end"],
                    }
                )

    return section_by_name, symbol_index, bank_index


def lookup_symbol_address(
    symbol_index: Dict[str, List[dict]],
    symbol_name: str,
    section_beg: int,
    section_end: int,
) -> Optional[int]:
    candidates = symbol_index.get(symbol_name, [])
    if not candidates:
        return None

    local = [c for c in candidates if section_beg <= c["address"] <= section_end]
    if local:
        candidates = local

    candidates = sorted(candidates, key=lambda c: c["address"])
    return candidates[0]["address"] if candidates else None


def build_section_reports(
    repo_root: Path,
    map_path: Path,
    scripts_paths: List[Path],
) -> Tuple[List[SectionReport], MapReader, str, Dict[int, dict]]:
    reader = load_reader(map_path)
    rom_type = detect_rom_banked_type(reader)
    if rom_type is None:
        return [], reader, "", {}

    section_by_name, symbol_index, bank_index = build_map_indexes(reader, rom_type)

    parsed_sections: List[dict] = []
    for scripts_path in scripts_paths:
        parsed_sections.extend(parse_scripts_file(scripts_path, repo_root))

    reports: List[SectionReport] = []

    for sec in parsed_sections:
        section_name = sec["name"]
        includes = sec["includes"]
        source_scripts = sec["source_scripts"]

        map_sec = section_by_name.get(section_name)
        if map_sec is None:
            print(
                f"warning: no section named '{section_name}' found in map",
                file=sys.stderr,
            )
            continue

        sec_beg = map_sec["beg"]
        sec_end = map_sec["end"]
        bank_no = map_sec["bank_no"]

        file_entries: List[FileReport] = []
        failed = False

        for include_rel in includes:
            include_path = resolve_path(repo_root, include_rel)
            label = first_global_label(include_path)
            if label is None:
                print(f"warning: no global label in {include_rel}", file=sys.stderr)
                failed = True
                break

            start = lookup_symbol_address(symbol_index, label, sec_beg, sec_end)
            if start is None:
                print(
                    f"warning: could not map label '{label}' from {include_rel} in section {section_name}",
                    file=sys.stderr,
                )
                failed = True
                break

            file_entries.append(
                FileReport(
                    include_path=include_rel,
                    label=label,
                    start=start,
                    end=0,
                    size=0,
                )
            )

        if failed or not file_entries:
            continue

        # Estimate file ranges by include order + section end.
        file_entries.sort(key=lambda e: e.start)
        for i, entry in enumerate(file_entries):
            end = (file_entries[i + 1].start - 1) if i + 1 < len(file_entries) else sec_end
            if end < entry.start:
                end = entry.start
            entry.end = end
            entry.size = end - entry.start + 1

        reports.append(
            SectionReport(
                source_scripts=source_scripts,
                section_name=section_name,
                bank_no=bank_no,
                section_start=sec_beg,
                section_end=sec_end,
                files=file_entries,
            )
        )

    return reports, reader, rom_type, bank_index


def build_bank_reports(
    section_reports: List[SectionReport],
    bank_index: Dict[int, dict],
) -> List[BankReport]:
    by_bank_sections: Dict[int, List[SectionReport]] = {}
    for s in section_reports:
        by_bank_sections.setdefault(s.bank_no, []).append(s)

    banks: List[BankReport] = []
    for bank_no in sorted(bank_index.keys()):
        map_sections = bank_index[bank_no].get("sections", [])
        used = sum(sec["end"] - sec["beg"] + 1 for sec in map_sections)
        used = min(max(used, 0), ROM_BANK_SIZE)
        free = max(0, ROM_BANK_SIZE - used)

        bank_sections = sorted(
            by_bank_sections.get(bank_no, []),
            key=lambda s: (s.section_start, s.section_name),
        )

        banks.append(
            BankReport(
                bank_no=bank_no,
                total=ROM_BANK_SIZE,
                used=used,
                free=free,
                sections=bank_sections,
            )
        )

    return banks


def render_summary(bank_reports: List[BankReport], rom_type: str) -> str:
    out: List[str] = []
    out.append(f"# {rom_type} bank report")
    out.append("")
    out.append("Structure: bank → section → files")
    out.append("")

    if not bank_reports:
        out.append("_No analyzable banks found._")
        return "\n".join(out)

    total_banks = len(bank_reports)
    grand_total = sum(b.total for b in bank_reports)
    grand_used = sum(b.used for b in bank_reports)
    grand_free = sum(b.free for b in bank_reports)

    out.append("<details>")
    out.append(
        f"<summary>Full report — Banks: {total_banks} — "
        f"Total: {fmt_bytes(grand_total)} — Used: {fmt_bytes(grand_used)} — Free: {fmt_bytes(grand_free)}</summary>"
    )
    out.append("")

    for bank in bank_reports:
        out.append("<details>")
        out.append(
            f"<summary>{rom_type} bank #{bank.bank_no} — "
            f"Total: {fmt_bytes(bank.total)} — Used: {fmt_bytes(bank.used)} — Free: {fmt_bytes(bank.free)}</summary>"
        )
        out.append("")
        out.append(f"- Sections shown: {len(bank.sections)}")
        out.append("")

        for section in bank.sections:
            out.append("<details>")
            out.append(
                f"<summary>{section.section_name} — "
                f"Range: `${section.section_start:04X}`–`${section.section_end:04X}` — "
                f"Size: {fmt_bytes(section.section_size)}</summary>"
            )
            out.append("")
            out.append(f"- Source scripts file: `{section.source_scripts}`")
            out.append(f"- Files: {len(section.files)}")
            out.append("")
            out.append("| File | Label | Start | End | Size |")
            out.append("|---|---|---:|---:|---:|")
            for f in section.files:
                out.append(
                    f"| `{f.include_path}` | `{f.label}` | "
                    f"`${f.start:04X}` | `${f.end:04X}` | {fmt_bytes(f.size)} |"
                )
            out.append("")
            out.append("</details>")
            out.append("")

        out.append("</details>")
        out.append("")

    out.append("</details>")
    out.append("")
    return "\n".join(out)


def main() -> int:
    parser = argparse.ArgumentParser()
    parser.add_argument("mapfile", help="Path to map file (e.g. pokegold.map)")
    parser.add_argument(
        "scriptsfile",
        nargs="?",
        default=None,
        help="Optional single scripts file (legacy mode). If omitted, --scripts-glob is used.",
    )
    parser.add_argument(
        "--scripts-glob",
        action="append",
        default=["**/scripts.asm"],
        help='Glob for scripts files (default: "**/scripts.asm"). Can be repeated.',
    )
    parser.add_argument(
        "--repo-root",
        default=None,
        help="Repository root (default: parent of this script dir).",
    )
    args = parser.parse_args()

    script_dir = Path(__file__).resolve().parent
    repo_root = Path(args.repo_root).resolve() if args.repo_root else script_dir.parent

    map_path = resolve_path(repo_root, args.mapfile)
    if not map_path.exists():
        print(f"error: map file not found: {map_path}", file=sys.stderr)
        return 1

    if args.scriptsfile:
        scripts_paths = [resolve_path(repo_root, args.scriptsfile)]
    else:
        scripts_paths = find_scripts_files(repo_root, args.scripts_glob)

    scripts_paths = [p for p in scripts_paths if p.exists()]
    if not scripts_paths:
        print("error: no scripts files found", file=sys.stderr)
        return 1

    section_reports, reader, rom_type, bank_index = build_section_reports(repo_root, map_path, scripts_paths)

    if not rom_type:
        print("error: could not detect a banked ROM type in map data", file=sys.stderr)
        return 1

    print(f"info: detected banked ROM type: {rom_type}", file=sys.stderr)
    print(f"info: banks in map: {len(bank_index)}", file=sys.stderr)
    print(f"info: sections mapped from scripts: {len(section_reports)}", file=sys.stderr)

    bank_reports = build_bank_reports(section_reports, bank_index)

    sys.stdout.write(render_summary(bank_reports, rom_type))
    if bank_reports:
        sys.stdout.write("\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())