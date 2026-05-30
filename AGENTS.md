# {{PROJECT_NAME}}

This file is the shared project instruction file for AI agents (Codex, Claude, Gemini, etc.) in this repository.
`CLAUDE.md` and `GEMINI.md` are symbolic links pointing to this file, ensuring all agents share the same project guidance.

## Scope

- These instructions apply to the entire repository.
- Keep changes focused and avoid broad rewrites unless explicitly requested.
- Prioritize code quality, readability, and adherence to existing conventions.

## Shared Memory

- Shared project memory lives under `.agent-memory/`.
- Before starting substantial work, read `.agent-memory/INDEX.md` and any linked files relevant to your task.
- Keep durable, cross-tool project context (architectural findings, known issues) in `.agent-memory/`.
- Keep tool-specific or private preferences out of `.agent-memory/`.

### 작업 메모리 기록 및 분류 규칙 (Memory Logs & Classification)

에이전트가 새롭게 발견한 사실, 이슈, 해결 방안은 에이전트 메모리 파일([project.md](file://./.agent-memory/project.md))에 **날짜별로 분류하여 누적 기록**해야 합니다.

1. **분류 기준 (Classification)**:
   - **`[Frontend / UI]`**: UI 레이아웃, 컴포넌트, 상태 관리, 런타임/빌드 스크립트 등
   - **`[Backend / API]`**: API 엔드포인트, 비즈니스 로직, 데이터베이스 스키마 및 연동 등
   - **`[Deployment / Infra]`**: Docker, Kubernetes, Helm 차트, CI/CD 파이프라인, 환경 설정 등
   - **`[Core / Architecture]`**: 전역 설정, 공통 모듈, 보안, 패키지 의존성 등

2. **기록 양식 (Structure)**:
   - **날짜 및 에이전트** (예: `2026-05-30 | Gemini`)
   - **현상 (Symptom)**: 발생한 문제나 관찰된 현상에 대한 상세 설명
   - **원인 (Root Cause)**: 소스코드 분석, 로그 분석 등을 통해 밝혀진 기술적 원인
   - **해결 방안 및 조치 (Resolution/Next Steps)**: 해결을 위한 구체적인 수정 내용 또는 명령어

---

## Source Of Truth

- Identify the main source of truth for your current task before making changes.
- Do not assume local environments or temporary folders are the source of truth if a remote config repository or remote database is defined.
- Always check the `.agent-memory/` directory for system-specific deployment pathways.

## Working Rules

- **Surgical Edits**: Prefer small, surgical edits. Do not refactor unrelated code.
- **Verification**: Verify the existing repository structure and read live files before assuming project conventions.
- **Safety First**:
  - **Never** commit or store secrets, API tokens, passwords, or machine-specific credentials in this repository.
  - Use [.env.example](file://./.env.example) to document environment variables instead of committing active `.env` files.
