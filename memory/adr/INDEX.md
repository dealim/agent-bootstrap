# ADR Index - {{PROJECT_NAME}}

`memory/adr/`는 확정된 아키텍처 결정, 코딩 컨벤션, 배포 규칙을 기록하는 문서를 보관합니다.

## When To Read

- 코드 변경, 새 기능 개발, 배포 작업 전에 확정된 규칙을 확인해야 할 때
- 새로운 아키텍처 결정이 기존 결정과 충돌하는지 확인해야 할 때
- 반복 이슈를 규칙으로 승격할지 판단해야 할 때

## File Rules

- ADR 문서는 `NNNN-short-title.md` 형식으로 작성합니다. 예: `0001-use-pinia.md`
- 번호는 4자리 연속 숫자를 사용합니다.
- 파일명은 소문자 kebab-case를 사용합니다.
- 확정된 사실만 기록합니다. 논의 중이거나 일시적인 내용은 `memory/issues/` 또는 `plans/`에 남깁니다.
- 이미 완료된 ADR은 수정하지 않고, 변경이 필요하면 새 ADR을 추가합니다.

## Document Template

```markdown
# ADR-NNNN: [Decision Title]

## Status

Proposed | Accepted | Deprecated | Superseded

## Context

어떤 문제나 제약 때문에 결정이 필요한지 작성합니다.

## Decision

확정된 결정을 구체적으로 작성합니다.

## Consequences

- 이 결정으로 생기는 장점, 비용, 후속 작업

## Alternatives

- 검토한 대안과 채택하지 않은 이유

## References

- 관련 PRD, 이슈, 계획서 링크
```

## Recording Rules

- 반복 이슈가 확정된 규칙이 되면 `memory/issues/`에서 ADR로 승격합니다.
- 요구사항 배경은 `memory/prd/`, 구현 계획은 `plans/`에 연결합니다.
