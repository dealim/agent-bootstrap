# Agent Bootstrap Skeleton

A generalized, plug-and-play template for bootstrapping AI-agent-assisted software development in any project. This structure is generalized from the agent development workflow used in **connex-v3**.

By setting up a standardized entrypoint (`AGENTS.md`), symlinks, and structured memory directories, this skeleton helps AI coding assistants (like Claude, Gemini, Cursor, Codex, and others) maintain context, track progress, log issues, and adhere to coding rules seamlessly across sessions.

---

## 📁 Repository Structure

```text
├── AGENTS.md                   # Master agent instruction file (the entrypoint)
├── CLAUDE.md                   # Symbolic link to AGENTS.md (for Claude Code / Claude Desktop)
├── GEMINI.md                   # Symbolic link to AGENTS.md (for Gemini Developer tools)
├── .cursorrules                # Root rule file for Cursor Editor
├── .agent-memory/              # Shared, durable agent memory logs
│   ├── INDEX.md                # Entry point for agent memory
│   ├── project.md              # Project history, architectural findings, and known issues
│   └── workflows.md            # Project-specific business logic & workflow guidelines
├── .codex/                     # Local memory for Codex-based agents
│   ├── README.md               # Codex instructions
│   └── memories/
│       └── [project-name].md   # Project-specific memory file for Codex
└── docs/
    └── superpowers/
        └── plans/
            └── template-plan.md # Standard markdown template for agent implementation plans
```

---

## 🚀 Getting Started

### 1. Clone this Repository
Clone this skeleton into your new project directory:
```bash
git clone https://github.com/dealim/agent-bootstrap.git your-new-project
cd your-new-project
```

### 2. Run the Initialization Script
We provide helper scripts to automatically rename files, replace placeholders with your project name, and establish symlinks:

#### On macOS / Linux:
```bash
./setup.sh "MyProjectName"
```

#### On Windows (PowerShell):
```powershell
.\setup.ps1 "MyProjectName"
```

The script will:
- Replace `{{PROJECT_NAME}}` placeholders across all memory and rules files.
- Rename the Codex memory file to match your project name.
- Recreate symbolic links for `CLAUDE.md` and `GEMINI.md` pointing to `AGENTS.md`.
- Ask if you want to re-initialize Git to clear the bootstrap skeleton's git history.

---

## 🧠 Memory Logging Rules (작업 메모리 기록 및 분류 규칙)

When AI agents work inside this repository, they are instructed to log their findings, issues, and resolutions inside `.agent-memory/project.md` immediately upon completion of their tasks, following a standard classification:

### 1. Classification (분류 기준)
* **`[Frontend / UI]`**: UI Layout, components, state management, runtime/build scripts.
* **`[Backend / API]`**: API endpoints, business logic, DB schema, external integrations.
* **`[Deployment / Infra]`**: Docker, Kubernetes, Helm charts, CI/CD pipelines, configurations.
* **`[Core / Architecture]`**: Global configurations, shared modules, security, dependencies.

### 2. Recording Format (기록 양식)
* **Date & Agent**: (e.g., `2026-05-30 | Gemini`)
* **Symptom (현상)**: Detailed description of the problem or observed behavior.
* **Root Cause (원인)**: Technical cause identified through analysis.
* **Resolution/Next Steps (해결 방안 및 조치)**: Specific code changes or commands executed to resolve the issue.

---

## 📋 Implementation Plans

For complex feature development, agents are encouraged to create structured markdown plans under `docs/superpowers/plans/` using the provided [template-plan.md](file://./docs/superpowers/plans/template-plan.md). This helps ensure alignment with users or other developers before writing any code.

---

## 📄 License
This bootstrap skeleton is open-source and free to use. Customize it to fit your team's specific coding guidelines!
