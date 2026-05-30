#!/usr/bin/env bash

# Exit immediately if a command exits with a non-zero status
set -e

# ANSI Color Codes for beautiful terminal output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}==============================================${NC}"
echo -e "${BLUE}      Agent Skeleton Bootstrap Initializer    ${NC}"
echo -e "${BLUE}==============================================${NC}"

# 1. Get Project Name
PROJECT_NAME="$1"

if [ -z "$PROJECT_NAME" ]; then
    read -p "Enter project name (e.g. MyAwesomeApp): " PROJECT_NAME
fi

if [ -z "$PROJECT_NAME" ]; then
    echo -e "${RED}Error: Project name cannot be empty.${NC}"
    exit 1
fi

# Generate lowercase name for file conventions
PROJECT_NAME_LOWER=$(echo "$PROJECT_NAME" | tr '[:upper:]' '[:lower:]')

echo -e "\nInitializing agent structure for project: ${GREEN}${PROJECT_NAME}${NC} (${PROJECT_NAME_LOWER})"

# 2. Replace placeholders in files
replace_placeholders() {
    local file="$1"
    if [ -f "$file" ]; then
        echo -e "Processing: ${file}"
        # Use a temporary file to avoid empty/corrupt files with sed on macOS/Linux
        sed "s/{{PROJECT_NAME}}/${PROJECT_NAME}/g; s/{{PROJECT_NAME_LOWER}}/${PROJECT_NAME_LOWER}/g" "$file" > "${file}.tmp"
        mv "${file}.tmp" "$file"
    fi
}

replace_placeholders "AGENTS.md"
replace_placeholders ".cursorrules"
replace_placeholders ".agent-memory/INDEX.md"
replace_placeholders ".agent-memory/context.md"
replace_placeholders ".agent-memory/decisions.md"
replace_placeholders ".agent-memory/issues.md"
replace_placeholders ".env.example"
replace_placeholders "docs/plans/TEMPLATE.md"

# 3. Create Symbolic Links
echo -e "Re-creating symbolic links for CLAUDE.md and GEMINI.md..."
rm -f CLAUDE.md GEMINI.md
ln -s AGENTS.md CLAUDE.md
ln -s AGENTS.md GEMINI.md

echo -e "${GREEN}✓ Symbolic links created successfully.${NC}"

# 4. Optional git clean-up recommendation
echo -e "\n${YELLOW}Would you like to re-initialize Git for this project? (y/n)${NC}"
read -r -p "This will delete the bootstrap git history and start fresh: " reset_git

if [[ "$reset_git" =~ ^[Yy]$ ]]; then
    rm -rf .git
    git init
    git add .
    git commit -m "Initial commit from agent-bootstrap skeleton"
    echo -e "${GREEN}✓ Git repository re-initialized.${NC}"
else
    echo -e "${BLUE}Skipped git re-initialization. Existing .git remains intact.${NC}"
fi

echo -e "\n${BLUE}==============================================${NC}"
echo -e "${GREEN}    Initialization Complete! Feel free to code. ${NC}"
echo -e "    Entrypoint: ${GREEN}AGENTS.md${NC} (linked to CLAUDE/GEMINI)"
echo -e "    Shared Memory: ${GREEN}.agent-memory/INDEX.md${NC}"
echo -e "${BLUE}==============================================${NC}"
