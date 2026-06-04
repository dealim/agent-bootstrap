# PRD Index - {{PROJECT_NAME}}

`memory/prd/`는 프로젝트 요구사항, 제품/업무 맥락, 현재 상태를 기록하는 문서를 보관합니다.

## When To Read

- 작업 시작 시 프로젝트 목적, 범위, 현재 상태를 파악해야 할 때
- 새 기능의 요구사항이나 사용자 흐름을 확인해야 할 때
- 프로젝트 상태, 핵심 경로, 기술 스택이 바뀌었는지 확인해야 할 때

## File Rules

- 프로젝트 전체 컨텍스트는 `PROJECT.md`로 작성합니다.
- 기능별 요구사항은 `YYYY-MM-DD-feature-name.md` 형식으로 작성합니다.
- 파일명은 소문자 kebab-case를 사용합니다.
- 오래된 요구사항을 덮어쓰지 말고, 변경 이력이 중요하면 새 문서를 추가합니다.

## Document Template

```markdown
# [Feature or Project Name]

## Background

왜 이 요구사항이 필요한지 작성합니다.

## Goals

- 달성해야 하는 목표

## Non-Goals

- 이번 범위에서 제외하는 항목

## Requirements

- 기능/정책/제약사항

## Current State

현재 구현 상태, 핵심 경로, 관련 시스템을 기록합니다.

## References

- 관련 문서, 이슈, ADR, 계획서 링크
```

## Recording Rules

- 확정된 기술 결정은 `memory/adr/`에 기록합니다.
- 버그와 장애 이력은 `memory/issues/`에 기록합니다.
- 구현 전 계획과 실행 step은 `plans/YYYY-MM-DD-{plan-name}/`에 작성합니다.
