# YYYY-MM-DD-{plan-name}

> **Status**: Draft | Approved | Completed
> **Author**: [Agent or Human Name]

## Background

왜 이 작업이 필요한지, 현재 시스템의 어떤 부분이 문제인지를 간결하게 설명합니다.

## Goal

이 계획이 달성하려는 최종 목표를 한두 문장으로 작성합니다.

## Scope

### In Scope
- 이 계획에서 다루는 항목들

### Out of Scope
- 이 계획에서 의도적으로 제외하는 항목들

## Steps

| Step | File | Goal |
|------|------|------|
| 0 | `step0-{slug}.md` | 첫 번째 독립 실행 단위 |
| 1 | `step1-{slug}.md` | 두 번째 독립 실행 단위 |

## Required Memory

이 plan 전체에서 참조할 수 있는 memory 후보를 기록합니다. 각 step은 이 중 실제 필요한 파일만 `Read First`에 포함합니다.

- `memory/INDEX.md`
- `memory/prd/...`
- `memory/adr/...`
- `memory/issues/...`

## Acceptance Criteria

- [ ] 각 step에 `Read First`, `Task`, `Acceptance Criteria`, `Update On Completion`, `Prohibited` 섹션이 있음
- [ ] 각 step이 독립 세션에서 실행 가능함
- [ ] 검증 명령 또는 수동 확인 절차가 명확함

## Follow-up

작업 완료 후 남은 과제나 후속 작업이 있으면 여기에 기록합니다.
완료된 결정사항과 반복 패턴은 `memory/adr/`에, 이슈와 해결 이력은 `memory/issues/`에, 요구사항과 프로젝트 상태 변경은 `memory/prd/`에 반영합니다.
