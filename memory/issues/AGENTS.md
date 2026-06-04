# Issues Agents - {{PROJECT_NAME}}

`memory/issues/`는 버그, 장애, 반복되는 함정, 해결 이력을 기록하는 문서를 보관합니다.

## When To Read

- 버그 수정, 장애 대응, 유사 이슈 조사 시
- 같은 문제가 과거에 있었는지 확인해야 할 때
- 반복되는 문제가 ADR로 승격될 정도인지 판단할 때

## File Rules

- 이슈 문서는 `YYYY-MM-DD-short-title.md` 형식으로 작성합니다.
- 파일명은 소문자 kebab-case를 사용합니다.
- 하나의 문서에는 하나의 이슈나 관련 이슈 묶음만 기록합니다.
- 해결되어 더 이상 의미 없는 이슈는 삭제할 수 있습니다. 히스토리는 git이 보관합니다.
- 해결되었지만 다른 에이전트가 또 빠질 수 있는 함정은 유지합니다.

## Categories

- `[Frontend / UI]`
- `[Backend / API]`
- `[Deployment / Infra]`
- `[Core / Architecture]`

## Document Template

```markdown
# [Category] Issue Title

## Date

YYYY-MM-DD

## Reported By

AgentName or HumanName

## Symptom

발생한 문제를 관찰 가능한 형태로 작성합니다.

## Cause

기술적 원인을 작성합니다.

## Resolution

구체적인 수정 내용과 검증 결과를 작성합니다.

## References

- 관련 PRD, ADR, 계획서, 커밋 링크
```

## Recording Rules

- 반복 패턴이 확정된 규칙이 되면 `memory/adr/`로 승격합니다.
- 요구사항 변경이 필요하면 `memory/prd/`에 반영합니다.
