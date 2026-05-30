# {{PROJECT_NAME}}

이 파일은 AI 에이전트(Claude, Gemini, Cursor, Codex 등)의 공유 프로젝트 지침 파일입니다.
`CLAUDE.md`와 `GEMINI.md`는 이 파일을 가리키는 심볼릭 링크이며, 모든 에이전트가 동일한 규칙을 따릅니다.

## Scope

- 이 지침은 저장소 전체에 적용됩니다.
- 광범위한 리팩토링보다 집중적이고 정확한 변경을 우선합니다.
- 기존 코드 컨벤션과 코드 품질, 가독성을 최우선으로 합니다.

---

## Agent Memory

에이전트의 공유 메모리는 `.agent-memory/` 디렉토리에 있습니다.

**작업 시작 전**: [INDEX.md](.agent-memory/INDEX.md)를 읽고, 작업 목적에 맞는 파일만 선택적으로 읽으세요.

| 파일 | 언제 읽나 | 내용 |
|------|----------|------|
| [context.md](.agent-memory/context.md) | **항상** | 프로젝트 개요, 기술 스택, 현재 상태 |
| [decisions.md](.agent-memory/decisions.md) | 코드 변경·배포 시 | 확정된 컨벤션, 배포 규칙, 아키텍처 결정 |
| [issues.md](.agent-memory/issues.md) | 디버깅·장애 대응 시 | 과거 이슈, 버그 원인, 해결 이력 |

### 기록 규칙

**작업 완료 후** 발견한 사실을 반드시 기록합니다:

1. **이슈/버그/발견사항** → `issues.md`에 날짜 역순으로 추가
2. **확정된 규칙/패턴** → `decisions.md`로 승격
3. **프로젝트 상태 변경** → `context.md` 갱신

이슈 기록 양식:
```
## YYYY-MM-DD | AgentName

### [카테고리] 제목
- **현상**: 발생한 문제
- **원인**: 기술적 원인
- **해결**: 구체적인 수정 내용
```

카테고리: `[Frontend / UI]`, `[Backend / API]`, `[Deployment / Infra]`, `[Core / Architecture]`

---

## Plans

큰 작업이나 아키텍처 변경 전에는 `docs/plans/`에 계획서를 작성하고 유저 승인을 받습니다.
- [TEMPLATE.md](docs/plans/TEMPLATE.md) 양식을 사용합니다.
- 완료된 계획서는 수정하지 않고 히스토리로 보존합니다.

## Working Rules

- **Surgical Edits**: 작은 범위의 정확한 수정. 관련 없는 코드를 리팩토링하지 않습니다.
- **Verify First**: 파일 구조를 확인하고 라이브 코드를 읽은 후 작업합니다.
- **Safety First**:
  - 시크릿, API 토큰, 비밀번호를 절대 커밋하지 않습니다.
  - [.env.example](.env.example)을 참고하여 환경 변수를 사용합니다.
