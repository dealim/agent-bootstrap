# YYYY-MM-DD - [Feature/Task Title]

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

## Proposed Changes

### [Component / Module A]
| File | Action | Description |
|------|--------|-------------|
| `path/to/file.ts` | Modify | 변경 내용 요약 |
| `path/to/new.ts` | Create | 새 파일 생성 이유 |

### [Component / Module B]
| File | Action | Description |
|------|--------|-------------|
| `path/to/config.yaml` | Modify | 설정 변경 내용 |

## Verification

- [ ] 단위 테스트 통과 (`npm test` / `pytest`)
- [ ] 수동 테스트 시나리오 확인
- [ ] 기존 기능 회귀(regression) 없음 확인

## Decisions & Trade-offs

작업 중 내린 핵심 결정사항과 그 이유를 기록합니다.
이 섹션은 나중에 "왜 이렇게 했는가?"를 추적할 때 가장 중요합니다.

## Follow-up

작업 완료 후 남은 과제나 후속 작업이 있으면 여기에 기록합니다.
완료된 결정사항과 반복 패턴은 `.agent-memory/decisions.md`에, 프로젝트 상태 변경은 `.agent-memory/context.md`에 반영합니다.
