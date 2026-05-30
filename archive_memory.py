#!/usr/bin/env python3
import os
import sys
import re
from datetime import datetime

# Colors for terminal output
GREEN = "\033[92m"
YELLOW = "\033[93m"
RED = "\033[91m"
NC = "\033[0m"

PROJECT_FILE_PATH = ".agent-memory/project.md"
ARCHIVE_DIR = ".agent-memory/archive"
MIN_ENTRIES_TO_KEEP = 3
DAYS_OLD_TO_ARCHIVE = 30

def print_err(msg):
    print(f"{RED}Error:{NC} {msg}", file=sys.stderr)

def print_success(msg):
    print(f"{GREEN}✓{NC} {msg}")

def archive_memory():
    if not os.path.exists(PROJECT_FILE_PATH):
        print_err(f"Memory file not found at '{PROJECT_FILE_PATH}'.")
        return False

    with open(PROJECT_FILE_PATH, "r", encoding="utf-8") as f:
        content = f.read()

    # Create archive directory if it doesn't exist
    os.makedirs(ARCHIVE_DIR, exist_ok=True)

    lines = content.splitlines()
    
    # We want to identify the categories and parse entries under them.
    # We will build a new file representation.
    new_lines = []
    
    # Simple state machine to parse the file
    current_category = None
    category_entries = {} # category -> list of (date, list of lines)
    header_lines = [] # lines before the first category
    footer_lines = [] # lines after the last category/entries (like Safety, etc.)
    
    category_pattern = re.compile(r"^###\s+\[(.*)\]")
    entry_header_pattern = re.compile(r"^####\s+(\d{4}-\d{2}-\d{2})\s*\|\s*([A-Za-z0-9_.-]+)\s*-\s*(.*)$")
    
    parsing_phase = "header" # header, categories, footer
    
    current_entry_lines = []
    current_entry_date = None
    
    for line in lines:
        cat_match = category_pattern.match(line)
        if cat_match:
            parsing_phase = "categories"
            if current_category and current_entry_date:
                category_entries[current_category].append((current_entry_date, current_entry_lines))
                current_entry_lines = []
                current_entry_date = None
                
            current_category = cat_match.group(1)
            if current_category not in category_entries:
                category_entries[current_category] = []
            continue
            
        if parsing_phase == "header":
            header_lines.append(line)
        elif parsing_phase == "categories":
            # Check if this is a new entry or we hit the footer (e.g. ## Safety)
            if line.startswith("## ") and not line.startswith("## Known Issues"):
                parsing_phase = "footer"
                if current_category and current_entry_date:
                    category_entries[current_category].append((current_entry_date, current_entry_lines))
                    current_entry_lines = []
                    current_entry_date = None
                footer_lines.append(line)
                continue
                
            entry_match = entry_header_pattern.match(line)
            if entry_match:
                if current_entry_date:
                    category_entries[current_category].append((current_entry_date, current_entry_lines))
                current_entry_date = entry_match.group(1)
                current_entry_lines = [line]
            else:
                if current_entry_date:
                    current_entry_lines.append(line)
                else:
                    # Lines immediately under category header but before any entry
                    # (like "*No findings logged yet.*")
                    # We just discard or keep them in header/footer?
                    # Let's skip placeholder comments
                    if "*No findings logged yet.*" not in line and line.strip():
                        # Put it in header for the category if needed, but we'll regenerate cleanly.
                        pass
        elif parsing_phase == "footer":
            footer_lines.append(line)

    # Flush final entry if parsing finished in categories state
    if parsing_phase == "categories" and current_category and current_entry_date:
        category_entries[current_category].append((current_entry_date, current_entry_lines))

    # Now, process entries for archiving
    today = datetime.now()
    archived_count = 0
    
    archived_by_month = {} # YYYY-MM -> list of strings (entries)

    updated_categories_content = []
    
    # We want to re-inject Known Issues header
    updated_categories_content.append("## Known Issues & Architectural Findings\n")
    
    for cat in ["Frontend / UI", "Backend / API", "Deployment / Infra", "Core / Architecture"]:
        updated_categories_content.append(f"### [{cat}]")
        
        entries = category_entries.get(cat, [])
        if not entries:
            updated_categories_content.append("*No findings logged yet.*\n")
            continue
            
        # Sort entries descending by date (newest first)
        # Entry is (date_str, lines)
        try:
            entries.sort(key=lambda x: datetime.strptime(x[0], "%Y-%m-%d"), reverse=True)
        except ValueError:
            # Fallback to string sort if date parsing fails
            entries.sort(key=lambda x: x[0], reverse=True)
            
        keep_entries = []
        archive_entries = []
        
        for idx, (date_str, entry_lines) in enumerate(entries):
            try:
                entry_date = datetime.strptime(date_str, "%Y-%m-%d")
                days_old = (today - entry_date).days
            except ValueError:
                days_old = 0 # Don't archive malformed dates
                
            # Keep if index is within minimum limit, or if it's not old enough
            if idx < MIN_ENTRIES_TO_KEEP or days_old < DAYS_OLD_TO_ARCHIVE:
                keep_entries.append(entry_lines)
            else:
                archive_entries.append((date_str, entry_lines))
                
        # Handle keeping entries
        if not keep_entries:
            updated_categories_content.append("*No findings logged yet.*\n")
        else:
            for entry_lines in keep_entries:
                updated_categories_content.extend(entry_lines)
            updated_categories_content.append("") # blank line between categories

        # Handle archived entries
        for date_str, entry_lines in archive_entries:
            month_key = date_str[:7] # YYYY-MM
            if month_key not in archived_by_month:
                archived_by_month[month_key] = []
            
            # Format nicely for archive
            archived_by_month[month_key].append(f"### Category: [{cat}]\n" + "\n".join(entry_lines) + "\n")
            archived_count += 1

    # Write archived entries to month files
    for month, entries in archived_by_month.items():
        archive_file = os.path.join(ARCHIVE_DIR, f"archive-{month}.md")
        file_exists = os.path.exists(archive_file)
        
        with open(archive_file, "a", encoding="utf-8") as af:
            if not file_exists:
                af.write(f"# Agent Memory Archive - {month}\n\n")
            af.write("\n---\n\n".join(entries) + "\n")
            
        print_success(f"Archived {len(entries)} entry/entries into '{archive_file}'")

    # If nothing changed, we don't need to overwrite project.md
    if archived_count > 0:
        # Reconstruct project.md
        # Strip trailing/leading blank lines from headers
        clean_headers = []
        for line in header_lines:
            # Stop if we hit the header we want to regenerate
            if line.startswith("## Known Issues"):
                break
            clean_headers.append(line)
            
        # Reconstruct the file content
        final_content = "\n".join(clean_headers).rstrip() + "\n\n"
        final_content += "\n".join(updated_categories_content).rstrip() + "\n\n"
        final_content += "\n".join(footer_lines).strip() + "\n"
        
        with open(PROJECT_FILE_PATH, "w", encoding="utf-8") as f:
            f.write(final_content)
            
        print_success(f"Archiving complete! Removed {archived_count} stale entries from '{PROJECT_FILE_PATH}'.")
    else:
        print_success("No stale entries to archive. Memory is clean!")

    return True

if __name__ == "__main__":
    success = archive_memory()
    sys.exit(0 if success else 1)
