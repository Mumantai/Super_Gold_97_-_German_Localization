#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
Usage examples:

  # Auto-find all scripts.asm files
  python3 tools/write_space_summary.py pokegold.map

  # Restrict to one file (backward-compatible style)
  python3 tools/write_space_summary.py pokegold.map data/maps/scripts.asm

  # Custom glob(s)
  python3 tools/write_space_summary.py pokegold.map --scripts-glob "**/scripts.asm"
  python3 tools/write_space_summary.py pokegold.map --scripts-glob "**/scripts.asm" --scripts-glob "**/*scripts*.asm"

Creates a GitHub Actions summary that shows:
- scripts source file
- ROMX section name
- ROM bank
- per-file ROM sizes inside each SECTION
- per-section used/free space
"""

from __future__ import annotations

import argparse
import re
import sys
from dataclasses import dataclass
from pathlib import Path
from typing import Dict, List, Optional

from mapreader import MapReader


SECTION_RE = re.compile(r'^\s*SECTION\s+"([^"]+)",\s*ROMX\b')
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
    files: List[FileReport]
    free_space: int = 0

    @property
    def section_size(self) -> int:
        return self.section_end - self.section_start + 1

    @property
    def used_space(self) -> int:
        return max(0, self.section_size - self.free_space)


def fmt_bytes(value: int) -> str:
    return f"{value} B (0x{value:04X})"


def resolve_path(base: Path, path_arg: str) -> Path:
    p = Path(path_arg)
    return p if p.is_absolute() else base / p


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

    for raw_line in path.read_text(encoding="utf-8").splitlines():
        line = raw_line.strip()

        m_section = SECTION_RE.match(line)
        if m_section:
            if current is not None:
                sections.append(current)
            current = {
                "name": m_section.group(1),
                "includes": [],
                "source_scripts": source_rel,
            }
            continue

        if current is None:
            continue

        m_include = INCLUDE_RE.match(line)
        if m_include:
            current["includes"].append(m_include.group(1))

    if current is not None:
        sections.append(current)

    return sections


def first_global_label(path: Path) -> Optional[str]:
    if not path.exists():
        return None

    for raw_line in path.read_text(encoding="utf-8").splitlines():
        code = raw_line.split(";", 1)[0].rstrip()
        if not code.strip():
            continue
        if code.lstrip().startswith("."):
            continue

        m = GLOBAL_LABEL_RE.match(code)
        if m:
            return m.group(1)

    return None


def load_map_reader(map_path: Path) -> MapReader:
    reader = MapReader()
    reader.read_map_data(map_path.read_text(encoding="utf-8").splitlines())
    return reader


def build_section_index(reader: MapReader) -> Dict[str, dict]:
    section_index: Dict[str, dict] = {}

    for bank_type_name, bank_type in reader.bank_types.items():
        if not bank_type["banked"]:
            continue

        bank_group = reader.bank_data.get(bank_type_name, {})
        for bank_no, bank_data in bank_group.items():
            for section in bank_data.get("sections", []):
                section_index.setdefault(
                    section["name"],
                    {
                        "bank_type": bank_type_name,
                        "bank_no": bank_no,
                        "beg": section["beg"],
                        "end": section["end"],
                        "symbols": section.get("symbols", []),
                    },
                )

    return section_index


def build_symbol_index(reader: MapReader) -> Dict[str, List[dict]]:
    symbol_index: Dict[str, List[dict]] = {}

    for bank_type_name, bank_type in reader.bank_types.items():
        if not bank_type["banked"]:
            continue

        bank_group = reader.bank_data.get(bank_type_name, {})
        for bank_no, bank_data in bank_group.items():
            for section in bank_data.get("sections", []):
                for sym in section.get("symbols", []):
                    symbol_index.setdefault(sym["name"], []).append(
                        {
                            "address": sym["address"],
                            "section_name": section["name"],
                            "section_beg": section["beg"],
                            "section_end": section["end"],
                            "bank_type": bank_type_name,
                            "bank_no": bank_no,
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

    in_section = [c for c in candidates if section_beg <= c["address"] <= section_end]
    if in_section:
        candidates = in_section

    candidates = sorted(candidates, key=lambda c: c["address"])
    return candidates[0]["address"] if candidates else None


def build_reports(
    repo_root: Path,
    map_path: Path,
    scripts_paths: List[Path],
) -> List[SectionReport]:
    reader = load_map_reader(map_path)
    section_index = build_section_index(reader)
    symbol_index = build_symbol_index(reader)

    scripts: List[dict] = []
    for scripts_path in scripts_paths:
        scripts.extend(parse_scripts_file(scripts_path, repo_root))

    reports: List[SectionReport] = []

    for section in scripts:
        section_name = section["name"]
        includes = section["includes"]
        source_scripts = section["source_scripts"]

        section_info = section_index.get(section_name)
        if section_info is None:
            print(
                f"warning: no ROMX section named '{section_name}' found in {map_path}",
                file=sys.stderr,
            )
            continue

        sec_beg = section_info["beg"]
        sec_end = section_info["end"]
        bank_no = section_info["bank_no"]

        file_entries: List[FileReport] = []
        missing_label = False

        for include_rel in includes:
            source_path = resolve_path(repo_root, include_rel)
            label = first_global_label(source_path)
            if label is None:
                print(
                    f"warning: no global label found in {include_rel}",
                    file=sys.stderr,
                )
                missing_label = True
                break

            start = lookup_symbol_address(symbol_index, label, sec_beg, sec_end)
            if start is None:
                print(
                    f"warning: could not find symbol '{label}' from {include_rel} in {map_path}",
                    file=sys.stderr,
                )
                missing_label = True
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

        if missing_label or not file_entries:
            continue

        for i, entry in enumerate(file_entries):
            if i + 1 < len(file_entries):
                next_start = file_entries[i + 1].start
                end = next_start - 1
            else:
                end = sec_end

            if end < entry.start:
                print(
                    f"warning: invalid file range in {section_name} for {entry.include_path} "
                    f"({entry.start:04X} > {end:04X})",
                    file=sys.stderr,
                )
                end = entry.start

            entry.end = end
            entry.size = end - entry.start + 1

        used_size = sum(e.size for e in file_entries)
        section_size = sec_end - sec_beg + 1
        free_space = max(0, section_size - used_size)

        reports.append(
            SectionReport(
                source_scripts=source_scripts,
                section_name=section_name,
                bank_no=bank_no,
                section_start=sec_beg,
                section_end=sec_end,
                files=file_entries,
                free_space=free_space,
            )
        )

    return reports


def render_summary(reports: List[SectionReport]) -> str:
    out: List[str] = []
    out.append("# File sizes in ROMX sections")
    out.append("")
    out.append(
        "Sizes refer to each file's ROM area "
        "(from the first global label to the next file start within the same `SECTION`)."
    )
    out.append("")

    if not reports:
        out.append("_No analyzable sections found._")
        return "\n".join(out)

    grouped: Dict[str, List[SectionReport]] = {}
    for r in reports:
        grouped.setdefault(r.source_scripts, []).append(r)

    out.append("<details>")
    out.append("<summary>Full report (all scripts.asm files)</summary>")
    out.append("")

    for source_file in sorted(grouped.keys()):
        sections = sorted(grouped[source_file], key=lambda s: (s.bank_no, s.section_start, s.section_name))
        total_size = sum(s.section_size for s in sections)
        total_used = sum(s.used_space for s in sections)
        total_free = sum(s.free_space for s in sections)

        out.append("<details>")
        out.append(
            f"<summary>{source_file} — Sections: {len(sections)} — "
            f"Total: {fmt_bytes(total_size)} — Used: {fmt_bytes(total_used)} — Free: {fmt_bytes(total_free)}</summary>"
        )
        out.append("")

        for section in sections:
            out.append("<details>")
            out.append(
                f"<summary>{section.section_name} — ROMX bank #{section.bank_no} — "
                f"Size: {fmt_bytes(section.section_size)} — Used: {fmt_bytes(section.used_space)} — Free: {fmt_bytes(section.free_space)}</summary>"
            )
            out.append("")
            out.append(f"- Range: `${section.section_start:04X}`–`${section.section_end:04X}`")
            out.append(f"- Files: {len(section.files)}")
            out.append(f"- Used in section: {fmt_bytes(section.used_space)}")
            out.append(f"- Free in section: {fmt_bytes(section.free_space)}")
            out.append("")
            out.append("| File | Label | Start | End | Size |")
            out.append("|---|---|---:|---:|---:|")

            for entry in section.files:
                out.append(
                    f"| `{entry.include_path}` | `{entry.label}` | "
                    f"`${entry.start:04X}` | `${entry.end:04X}` | {fmt_bytes(entry.size)} |"
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
    parser.add_argument("mapfile", help="Path to pokegold.map")
    parser.add_argument(
        "scriptsfile",
        nargs="?",
        default=None,
        help="Optional single scripts file (e.g. data/maps/scripts.asm). If omitted, --scripts-glob is used.",
    )
    parser.add_argument(
        "--scripts-glob",
        action="append",
        default=["**/scripts.asm"],
        help='Glob pattern for scripts files (default: "**/scripts.asm"). Can be repeated.',
    )
    parser.add_argument(
        "--repo-root",
        default=None,
        help="Repository root (defaults to the parent of this script's directory)",
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

    reports = build_reports(repo_root, map_path, scripts_paths)
    sys.stdout.write(render_summary(reports))
    if reports:
        sys.stdout.write("\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())