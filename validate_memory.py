#!/usr/bin/env python3
import os
import sys
import re

# Colors for terminal output
GREEN = "\033[92m"
YELLOW = "\033[93m"
RED = "\033[91m"
NC = "\033[0m"

MEMORY_FILE_PATH = ".agent-memory/project.md"

def print_err(msg):
    print(f"{RED}Error:{NC} {msg}", file=sys.stderr)

def print_warn(msg):
    print(f"{YELLOW}Warning:{NC} {msg}")

def validate_memory():
    if not os.path.exists(MEMORY_FILE_PATH):
        print_err(f"Memory file not found at '{MEMORY_FILE_PATH}'.")
        return False

    with open(MEMORY_FILE_PATH, "r", encoding="utf-8") as f:
        content = f.read()

    lines = content.splitlines()
    errors = 0
    warnings = 0

    # 1. Check basic headers
    if not re.search(r"^# Project Memory", content, re.MULTILINE):
        print_err("Missing main header '# Project Memory'")
        errors += 1

    if not re.search(r"^## Known Issues & Architectural Findings", content, re.MULTILINE):
        print_err("Missing section '## Known Issues & Architectural Findings'")
        errors += 1

    # 2. Extract entries under categories
    # Categories: [Frontend / UI], [Backend / API], [Deployment / Infra], [Core / Architecture]
    categories = ["Frontend / UI", "Backend / API", "Deployment / Infra", "Core / Architecture"]
    for cat in categories:
        cat_header = f"### [{cat}]"
        if cat_header not in content:
            print_warn(f"Category header '{cat_header}' not found.")
            warnings += 1

    # Regex to find log entry headers: e.g., "#### 2026-05-30 | Gemini - Blah Blah"
    entry_header_pattern = re.compile(r"^####\s+(\d{4}-\d{2}-\d{2})\s*\|\s*([A-Za-z0-9_.-]+)\s*-\s*(.*)$")
    
    current_entry = None
    entry_fields = []

    for i, line in enumerate(lines, 1):
        if line.startswith("####"):
            # If we had a previous entry, validate it had the required fields
            if current_entry:
                validate_entry_fields(current_entry, entry_fields, errors)

            match = entry_header_pattern.match(line)
            if not match:
                print_err(f"Line {i}: Log entry header does not match pattern '#### YYYY-MM-DD | AgentName - Title'.\n  Found: '{line}'")
                errors += 1
                current_entry = None
            else:
                current_entry = {
                    "line": i,
                    "date": match.group(1),
                    "agent": match.group(2),
                    "title": match.group(3)
                }
                entry_fields = []
        elif current_entry:
            # Look for structured fields
            if "- **현상" in line or "Symptom" in line:
                entry_fields.append("symptom")
            elif "- **원인" in line or "Root Cause" in line:
                entry_fields.append("cause")
            elif "- **해결" in line or "Resolution" in line:
                entry_fields.append("resolution")

    # Validate final entry
    if current_entry:
        errors = validate_entry_fields(current_entry, entry_fields, errors)

    if errors > 0:
        print(f"\n{RED}Validation failed with {errors} error(s) and {warnings} warning(s).{NC}")
        return False
    else:
        print(f"{GREEN}✓ Memory file '{MEMORY_FILE_PATH}' is valid.{NC} ({warnings} warning(s))")
        return True

def validate_entry_fields(entry, fields, current_errors):
    missing = []
    if "symptom" not in fields:
        missing.append("Symptom (현상)")
    if "cause" not in fields:
        missing.append("Root Cause (원인)")
    if "resolution" not in fields:
        missing.append("Resolution/Next Steps (해결 방안 및 조치)")
    
    if missing:
        print_err(f"Entry on line {entry['line']} ('{entry['date']} | {entry['agent']} - {entry['title']}') is missing fields: {', '.join(missing)}")
        return current_errors + len(missing)
    return current_errors

if __name__ == "__main__":
    success = validate_memory()
    sys.exit(0 if success else 1)
