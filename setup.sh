#!/usr/bin/env bash

if [ -z "${BASH_VERSION:-}" ]; then
    echo "Please run with bash: ./setup.sh \"MyProjectName\""
    exit 1
fi

# Exit immediately if a command exits with a non-zero status
set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

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
PROJECT_NAME="${1:-}"

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
escape_sed_replacement() {
    printf '%s' "$1" | sed 's/[\/&\]/\\&/g'
}

PROJECT_NAME_ESCAPED="$(escape_sed_replacement "$PROJECT_NAME")"
PROJECT_NAME_LOWER_ESCAPED="$(escape_sed_replacement "$PROJECT_NAME_LOWER")"

replace_placeholders() {
    local file="$1"
    if [ -f "$file" ]; then
        echo -e "Processing: ${file}"
        # Use a temporary file to avoid empty/corrupt files with sed on macOS/Linux
        local tmp="${file}.tmp.$$"
        sed "s/{{PROJECT_NAME}}/${PROJECT_NAME_ESCAPED}/g; s/{{PROJECT_NAME_LOWER}}/${PROJECT_NAME_LOWER_ESCAPED}/g" "$file" > "$tmp"
        mv "$tmp" "$file"
    fi
}

replace_placeholders "AGENTS.md"
replace_placeholders ".cursorrules"
replace_placeholders "memory/AGENTS.md"
replace_placeholders "memory/prd/AGENTS.md"
replace_placeholders "memory/adr/AGENTS.md"
replace_placeholders "memory/issues/AGENTS.md"
replace_placeholders "plans/AGENTS.md"
replace_placeholders ".env.example"
replace_placeholders "plans/TEMPLATE.md"

# 3. Create Symbolic Links
echo -e "Re-creating symbolic links for CLAUDE.md and GEMINI.md..."
ensure_agent_symlink() {
    local link="$1"
    if [ -L "$link" ] && [ "$(readlink "$link")" = "AGENTS.md" ]; then
        return
    fi
    if [ -L "$link" ]; then
        echo -e "${YELLOW}Replacing existing symlink ${link}.${NC}"
        rm "$link"
    elif [ -e "$link" ]; then
        if cmp -s "$link" "AGENTS.md"; then
            echo -e "${YELLOW}Replacing duplicate ${link} with symlink to AGENTS.md.${NC}"
            rm "$link"
        else
            local backup="${link}.backup.$(date +%Y%m%d%H%M%S)"
            echo -e "${YELLOW}Existing ${link} differs from AGENTS.md; moving it to ${backup}.${NC}"
            mv "$link" "$backup"
        fi
    fi
    ln -s AGENTS.md "$link"
}

ensure_agent_symlink "CLAUDE.md"
ensure_agent_symlink "GEMINI.md"

echo -e "${GREEN}✓ Symbolic links created successfully.${NC}"

# 4. Optional git clean-up recommendation
echo -e "\n${YELLOW}Would you like to re-initialize Git for this project? (y/n)${NC}"
read -r -p "This will delete the bootstrap git history and start fresh: " reset_git

if [[ "$reset_git" =~ ^[Yy]$ ]]; then
    if ! command -v git >/dev/null 2>&1; then
        echo -e "${RED}Error: git is required to re-initialize the repository.${NC}"
        exit 1
    fi
    if ! git config user.name >/dev/null || ! git config user.email >/dev/null; then
        echo -e "${RED}Error: git user.name and user.email must be configured before re-initializing.${NC}"
        exit 1
    fi

    git_backup=""
    if [ -d .git ]; then
        git_backup=".git.backup.$(date +%Y%m%d%H%M%S)"
        mv .git "$git_backup"
        echo -e "${YELLOW}Existing .git moved to ${git_backup}.${NC}"
    fi

    if git init && git add . && git commit -m "Initial commit from agent-bootstrap skeleton"; then
        if [ -n "$git_backup" ]; then
            echo -e "${YELLOW}Previous git metadata remains available at ${git_backup}.${NC}"
        fi
    else
        echo -e "${RED}Error: Git re-initialization failed.${NC}"
        if [ -n "$git_backup" ]; then
            rm -rf .git
            mv "$git_backup" .git
            echo -e "${YELLOW}Restored original .git directory.${NC}"
        fi
        exit 1
    fi
    echo -e "${GREEN}✓ Git repository re-initialized.${NC}"
else
    echo -e "${BLUE}Skipped git re-initialization. Existing .git remains intact.${NC}"
fi

echo -e "\n${BLUE}==============================================${NC}"
echo -e "${GREEN}    Initialization Complete! Feel free to code. ${NC}"
echo -e "    Entrypoint: ${GREEN}AGENTS.md${NC} (linked to CLAUDE/GEMINI)"
echo -e "    Memory Agents: ${GREEN}memory/AGENTS.md${NC}"
echo -e "    Plans Agents: ${GREEN}plans/AGENTS.md${NC}"
echo -e "${BLUE}==============================================${NC}"
