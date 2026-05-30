# Shared Agent Memory - {{PROJECT_NAME}}

이 디렉토리는 AI 에이전트(Claude, Gemini, Cursor 등)의 공유 프로젝트 메모리입니다.
**작업 시작 전 이 파일을 먼저 읽고**, 작업과 관련된 파일만 열어주세요.

## Memory Lifecycle

에이전트의 지식은 3단계로 관리됩니다. 자세한 규칙은 [AGENTS.md](file://../AGENTS.md)를 참고하세요.

| 단계 | 위치 | 역할 |
|------|------|------|
| 1단계 - 계획 | [docs/plans/](file://../../docs/plans/) | 작업 전 계획서 작성 및 유저 승인 |
| 2단계 - 발견 기록 | [project.md](file://./project.md) | 이슈, 버그 원인, 아키텍처 발견사항 누적 |
| 3단계 - 영구 가이드 | [workflows.md](file://./workflows.md) | 확정된 배포 규칙, API 표준, 반복 패턴 |

## Update Rules

- `project.md`는 **날짜 역순(최신이 위)** 으로 기록합니다.
- `workflows.md`는 **확정된 규칙만** 기록합니다. 일시적인 이슈 로그는 `project.md`에 남깁니다.
- 시크릿, 토큰, 크리덴셜은 절대 기록하지 않습니다.
