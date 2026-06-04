# Memory Index - {{PROJECT_NAME}}

> **이 파일을 가장 먼저 읽으세요.** 작업 목적에 맞는 memory 디렉토리만 선택적으로 열어 토큰을 절약합니다.
> 특정 plan step을 실행할 때는 `plans/YYYY-MM-DD-{plan-name}/stepN-{slug}.md`의 `Read First` 목록을 우선합니다.

## Directory Map

| 디렉토리 | 언제 읽나 | 내용 |
|----------|----------|------|
| [prd/](prd/INDEX.md) | **항상** | 프로젝트 요구사항, 제품/업무 맥락, 현재 상태 |
| [adr/](adr/INDEX.md) | 코드 변경·배포·아키텍처 결정 시 | 확정된 컨벤션, 배포 규칙, 아키텍처 결정 |
| [issues/](issues/INDEX.md) | 디버깅·장애 대응 시 | 과거 이슈, 버그 원인, 해결 이력 |

## Reading Rules

- 프로젝트 파악, 간단한 질문: [prd/INDEX.md](prd/INDEX.md)
- 코드 변경, 새 기능 개발: [prd/INDEX.md](prd/INDEX.md) + [adr/INDEX.md](adr/INDEX.md)
- 버그 수정, 장애 대응: [prd/INDEX.md](prd/INDEX.md) + [issues/INDEX.md](issues/INDEX.md)
- 배포, 인프라 작업: [prd/INDEX.md](prd/INDEX.md) + [adr/INDEX.md](adr/INDEX.md)
- plan 실행 작업: 현재 `plans/YYYY-MM-DD-{plan-name}/stepN-{slug}.md`의 `Read First` 목록

## Recording Rules

- 요구사항, 프로젝트 맥락, 현재 상태 변경은 `memory/prd/`에 기록합니다.
- 확정된 규칙, 패턴, 아키텍처 결정은 `memory/adr/`에 기록합니다.
- 이슈, 버그, 장애 원인과 해결 내용은 `memory/issues/`에 기록합니다.
- 큰 작업이나 아키텍처 변경 계획과 실행 step은 `plans/YYYY-MM-DD-{plan-name}/`에 작성하고 승인 후 진행합니다.
- 모든 memory 디렉토리는 `INDEX.md`를 포함하고, 해당 폴더에 파일을 만드는 규칙과 템플릿을 설명합니다.
- 시크릿, 토큰, 크리덴셜은 어떤 문서에도 기록하지 않습니다.
