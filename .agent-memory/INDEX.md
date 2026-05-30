# Shared Agent Memory

This directory stores shared project memory for AI agents (Claude, Gemini, Cursor, etc.).

Read this file first, then open only the task-relevant linked file.

## Files & Directories

- [project.md](file://./project.md): Stable repository context, working rules, known issues, and architectural findings.
- [workflows.md](file://./workflows.md): Specific guidelines for business logic, external API integrations, or pipelines.
- [archive/](file://./archive/): Contains monthly markdown archive files (e.g. `archive-2026-05.md`) of older log entries.

## Tools & Automation

- **Validation**: Run `./validate_memory.py` to check if `project.md` complies with formatting standards.
- **Archiving**: Run `./archive_memory.py` to prune stale logs (older than 30 days) and move them to the `archive/` folder to prevent context window bloat.

## Update Rules

- Keep `project.md` clean, structured, and short.
- Always use the validation script when making edits.
- Do not store secrets, tokens, or credentials here.
