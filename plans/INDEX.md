# Plans Index - {{PROJECT_NAME}}

`plans/`는 큰 작업이나 아키텍처 변경을 독립 세션에서 실행할 수 있도록 쪼갠 dated harness를 보관합니다.

## When To Read

- 큰 작업이나 아키텍처 변경을 시작하기 전
- 승인된 계획의 범위와 검증 방법을 확인해야 할 때
- 현재 실행할 step이 어떤 memory 파일을 읽어야 하는지 확인해야 할 때

## File Rules

- plan 디렉토리는 `YYYY-MM-DD-{plan-name}/` 형식으로 작성합니다.
- `{plan-name}`과 step slug는 소문자 kebab-case를 사용합니다.
- 각 plan 디렉토리는 `index.json`과 하나 이상의 `stepN-{slug}.md`를 포함합니다.
- step 번호는 0부터 시작하고, 파일명은 `step0-{slug}.md`, `step1-{slug}.md`처럼 작성합니다.
- 완료된 plan과 step은 삭제하지 않고 히스토리로 보존합니다.

## Plan Directory Template

```text
plans/YYYY-MM-DD-{plan-name}/
├── index.json
├── step0-{slug}.md
├── step1-{slug}.md
└── stepN-{slug}.md
```

## index.json Template

```json
{
  "plan": "YYYY-MM-DD-{plan-name}",
  "status": "pending",
  "steps": [
    {
      "step": 0,
      "file": "step0-{slug}.md",
      "status": "pending"
    }
  ]
}
```

Status values: `pending`, `completed`, `error`, `blocked`.

## Step Template

```markdown
# Step N: {Title}

## Read First

- memory/INDEX.md
- memory/adr/0001-example.md

## Context

이 step이 독립 세션에서 실행되어도 이해 가능한 배경을 작성합니다.

## Task

구체적인 작업 지시를 작성합니다.

## Acceptance Criteria

실행 가능한 검증 명령 또는 확인 절차를 작성합니다.

## Update On Completion

- 성공 시 `plans/YYYY-MM-DD-{plan-name}/index.json`의 해당 step을 `completed`로 변경
- 발견한 이슈는 `memory/issues/`
- 확정된 결정은 `memory/adr/`
- 요구사항 변경은 `memory/prd/`

## Prohibited

- 이 step에서 하지 말아야 할 작업을 작성합니다.
```

## Recording Rules

- 큰 작업이나 아키텍처 변경 전에는 dated plan 디렉토리와 step 파일을 작성하고 유저 승인을 받습니다.
- 각 step의 `Read First` 목록은 해당 독립 세션이 실제로 읽어야 할 memory 파일만 포함합니다.
- 작업 중 확정된 결정은 `memory/adr/`, 이슈와 해결 이력은 `memory/issues/`, 요구사항과 프로젝트 상태 변경은 `memory/prd/`에 반영합니다.
