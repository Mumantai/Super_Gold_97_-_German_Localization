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
- bank
  - sections in that bank
    - files in each section (estimated from first global labels in INCLUDE order, if available)
"""

from __future__ import annotations

import argparse
import re
import sys
from dataclasses import dataclass, field
from pathlib import Path
from typing import Dict, List, Optional, Tuple

from mapreader import MapReader


# Accept ROMX and ROM declarations in scripts files.
SECTION_RE = re.compile(r'^\s*SECTION\s+"([^"]+)",\s*ROM(?:X)?\b')
INCLUDE_RE = re.compile(r'^\s*INCLUDE\s+"([^"]+)"')
GLOBAL_LABEL_RE = re.compile(r'^\s*([A-Za-z_][A-Za-z0-9_]*)\s*::?')


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
    files: List[FileReport] = field(default_factory=list)

    @property
    def section_size(self) -> int:
        return self.section_end - self.section_start + 1


@dataclass
class BankReport:
    bank_name: str
    bank_no: int
    total: int
    used: int
    free: int
    sections: List[SectionReport]


def fmt_bytes(value: int) -> str:
    return f"{value} B (0x{value:04X})"


def resolve_path(base: Path, p: str) -> Path:
    path = Path(p)
    return path if path.is_absolute() else base / p


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


def pick_banked_rom_type(reader: MapReader) -> Optional[str]:
    # 1) Prefer ROMX if it has bank data.
    if reader.bank_data.get("ROMX"):
        return "ROMX"

    # 2) Any banked type with data, but never ROM0.
    for t_name, t_info in reader.bank_types.items():
        if t_name.upper() == "ROM0":
            continue
        if t_info.get("banked", False) and reader.bank_data.get(t_name):
            return t_name

    return None


def build_symbol_index_for_type(reader: MapReader, bank_type: str) -> Dict[str, List[dict]]:
    symbol_index: Dict[str, List[dict]] = {}
    for bank_no, bank_data in reader.bank_data.get(bank_type, {}).items():
        for sec in bank_data.get("sections", []):
            for sym in sec.get("symbols", []):
                symbol_index.setdefault(sym["name"], []).append(
                    {
                        "address": sym["address"],
                        "bank_no": bank_no,
                        "section_name": sec["name"],
                        "section_beg": sec["beg"],
                        "section_end": sec["end"],
                    }
                )
    return symbol_index


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


def build_base_bank_reports(
    reader: MapReader,
    bank_type: str,
) -> Tuple[List[BankReport], Dict[Tuple[int, str], SectionReport]]:
    bank_type_info = reader.bank_types.get(bank_type, {})
    bank_size = bank_type_info.get("size", 0x4000)

    by_bank: List[BankReport] = []
    section_lookup: Dict[Tuple[int, str], SectionReport] = {}

    for bank_no in sorted(reader.bank_data.get(bank_type, {}).keys()):
        bank_data = reader.bank_data[bank_type][bank_no]
        map_sections = bank_data.get("sections", [])

        used = sum(sec["end"] - sec["beg"] + 1 for sec in map_sections)
        used = min(max(used, 0), bank_size)
        free = max(0, bank_size - used)

        section_reports: List[SectionReport] = []
        for sec in sorted(map_sections, key=lambda s: (s["beg"], s["name"])):
            sr = SectionReport(
                source_scripts="",
                section_name=sec["name"],
                bank_no=bank_no,
                section_start=sec["beg"],
                section_end=sec["end"],
                files=[],
            )
            section_reports.append(sr)
            section_lookup[(bank_no, sec["name"])] = sr

        by_bank.append(
            BankReport(
                bank_name=bank_type,
                bank_no=bank_no,
                total=bank_size,
                used=used,
                free=free,
                sections=section_reports,
            )
        )

    return by_bank, section_lookup


def attach_file_breakdown(
    repo_root: Path,
    reader: MapReader,
    bank_type: str,
    section_lookup: Dict[Tuple[int, str], SectionReport],
    scripts_paths: List[Path],
) -> None:
    symbol_index = build_symbol_index_for_type(reader, bank_type)

    parsed_sections: List[dict] = []
    for p in scripts_paths:
        parsed_sections.extend(parse_scripts_file(p, repo_root))

    # Name->section fallback (first occurrence)
    section_index_by_name: Dict[str, dict] = {}
    for bank_no, bank_data in reader.bank_data.get(bank_type, {}).items():
        for sec in bank_data.get("sections", []):
            section_index_by_name.setdefault(
                sec["name"],
                {"bank_no": bank_no, "beg": sec["beg"], "end": sec["end"]},
            )

    for parsed in parsed_sections:
        name = parsed["name"]
        includes = parsed["includes"]
        source_scripts = parsed["source_scripts"]

        map_sec = section_index_by_name.get(name)
        if not map_sec:
            continue

        key = (map_sec["bank_no"], name)
        target = section_lookup.get(key)
        if not target:
            continue

        target.source_scripts = source_scripts

        entries: List[FileReport] = []

        for include_rel in includes:
            include_path = resolve_path(repo_root, include_rel)
            label = first_global_label(include_path)
            if label is None:
                continue

            start = lookup_symbol_address(symbol_index, label, map_sec["beg"], map_sec["end"])
            if start is None:
                continue

            entries.append(
                FileReport(
                    include_path=include_rel,
                    label=label,
                    start=start,
                    end=0,
                    size=0,
                )
            )

        if not entries:
            continue

        entries.sort(key=lambda e: e.start)
        for i, e in enumerate(entries):
            end = entries[i + 1].start - 1 if i + 1 < len(entries) else map_sec["end"]
            if end < e.start:
                end = e.start
            e.end = end
            e.size = end - e.start + 1

        target.files = entries


def render_summary(bank_reports: List[BankReport]) -> str:
    out: List[str] = []
    if not bank_reports:
        out.append("# ROM bank report")
        out.append("")
        out.append("_No analyzable banked ROM banks found._")
        return "\n".join(out)

    bank_name = bank_reports[0].bank_name
    out.append(f"# {bank_name} bank report")
    out.append("")
    out.append("Structure: bank -> section -> files")
    out.append("")

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
            f"<summary>{bank.bank_name} bank #{bank.bank_no} — "
            f"Total: {fmt_bytes(bank.total)} — Used: {fmt_bytes(bank.used)} — Free: {fmt_bytes(bank.free)}</summary>"
        )
        out.append("")
        out.append(f"- Sections: {len(bank.sections)}")
        out.append("")

        for sec in bank.sections:
            out.append("<details>")
            out.append(
                f"<summary>{sec.section_name} — "
                f"Range: `${sec.section_start:04X}`-`${sec.section_end:04X}` — "
                f"Size: {fmt_bytes(sec.section_size)}</summary>"
            )
            out.append("")
            if sec.source_scripts:
                out.append(f"- Source scripts file: `{sec.source_scripts}`")
            if sec.files:
                out.append(f"- Files: {len(sec.files)}")
                out.append("")
                out.append("| File | Label | Start | End | Size |")
                out.append("|---|---|---:|---:|---:|")
                for f in sec.files:
                    out.append(
                        f"| `{f.include_path}` | `{f.label}` | "
                        f"`${f.start:04X}` | `${f.end:04X}` | {fmt_bytes(f.size)} |"
                    )
            else:
                out.append("- Files: _no file breakdown available for this section_")
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
        print("warning: no scripts files found; continuing without file breakdown", file=sys.stderr)

    reader = load_reader(map_path)
    bank_type = pick_banked_rom_type(reader)
    if not bank_type:
        print("error: could not detect a banked ROM type in map data", file=sys.stderr)
        return 1

    bank_reports, section_lookup = build_base_bank_reports(reader, bank_type)

    if scripts_paths:
        attach_file_breakdown(repo_root, reader, bank_type, section_lookup, scripts_paths)

    print(f"info: detected banked ROM type: {bank_type}", file=sys.stderr)
    print(f"info: banks found: {len(bank_reports)}", file=sys.stderr)

    sys.stdout.write(render_summary(bank_reports))
    sys.stdout.write("\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())