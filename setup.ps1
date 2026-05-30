# Agent Skeleton Bootstrap Initializer for Windows (PowerShell)

Write-Host "==============================================" -ForegroundColor Blue
Write-Host "      Agent Skeleton Bootstrap Initializer    " -ForegroundColor Blue
Write-Host "==============================================" -ForegroundColor Blue

# 1. Get Project Name
$projectName = $args[0]

if (-not $projectName) {
    $projectName = Read-Host "Enter project name (e.g. MyAwesomeApp)"
}

if (-not $projectName) {
    Write-Error "Error: Project name cannot be empty."
    exit 1
}

$projectNameLower = $projectName.ToLower()

Write-Host "`nInitializing agent structure for project: $projectName ($projectNameLower)" -ForegroundColor Green

# 2. Replace placeholders in files
function Replace-Placeholders($file) {
    if (Test-Path $file) {
        Write-Host "Processing: $file"
        $content = Get-Content -Raw -Path $file
        $content = $content -replace "{{PROJECT_NAME}}", $projectName
        $content = $content -replace "{{PROJECT_NAME_LOWER}}", $projectNameLower
        Set-Content -NoNewline -Path $file -Value $content
    }
}

Replace-Placeholders "AGENTS.md"
Replace-Placeholders ".cursorrules"
Replace-Placeholders ".agent-memory/INDEX.md"
Replace-Placeholders ".agent-memory/project.md"
Replace-Placeholders ".agent-memory/workflows.md"

# 3. Create Symbolic Links (Symlinks on Windows can be tricky and may require Admin privileges)
Write-Host "Creating symbolic links for CLAUDE.md and GEMINI.md..."
if (Test-Path "CLAUDE.md") { Remove-Item "CLAUDE.md" -Force }
if (Test-Path "GEMINI.md") { Remove-Item "GEMINI.md" -Force }

try {
    # Attempt to create symbolic links
    New-Item -ItemType SymbolicLink -Path "CLAUDE.md" -Target "AGENTS.md" -ErrorAction Stop | Out-Null
    New-Item -ItemType SymbolicLink -Path "GEMINI.md" -Target "AGENTS.md" -ErrorAction Stop | Out-Null
    Write-Host "✓ Symbolic links created successfully." -ForegroundColor Green
}
catch {
    Write-Host "Warning: Symbolic links could not be created directly (Admin privileges may be required)." -ForegroundColor Yellow
    Write-Host "Falling back to creating hard links or copying files..." -ForegroundColor Yellow
    try {
        # Fallback to hard links
        New-Item -ItemType HardLink -Path "CLAUDE.md" -Target "AGENTS.md" -ErrorAction Stop | Out-Null
        New-Item -ItemType HardLink -Path "GEMINI.md" -Target "AGENTS.md" -ErrorAction Stop | Out-Null
        Write-Host "✓ Hard links created successfully." -ForegroundColor Green
    }
    catch {
        # Final fallback to standard copies
        Copy-Item -Path "AGENTS.md" -Destination "CLAUDE.md" -Force
        Copy-Item -Path "AGENTS.md" -Destination "GEMINI.md" -Force
        Write-Host "✓ Copied AGENTS.md to CLAUDE.md and GEMINI.md (links failed)." -ForegroundColor Green
    }
}

# 4. Optional git clean-up recommendation
$resetGit = Read-Host "Would you like to re-initialize Git for this project? (y/n)"
if ($resetGit -eq 'y' -or $resetGit -eq 'Y') {
    if (Test-Path ".git") { Remove-Item ".git" -Recurse -Force }
    git init
    git add .
    git commit -m "Initial commit from agent-bootstrap skeleton"
    Write-Host "✓ Git repository re-initialized." -ForegroundColor Green
} else {
    Write-Host "Skipped git re-initialization. Existing .git remains intact." -ForegroundColor Blue
}

Write-Host "`n==============================================" -ForegroundColor Blue
Write-Host "    Initialization Complete! Feel free to code. " -ForegroundColor Green
Write-Host "    Entrypoint: AGENTS.md (linked to CLAUDE/GEMINI)"
Write-Host "    Shared Memory: .agent-memory/INDEX.md"
Write-Host "==============================================" -ForegroundColor Blue
