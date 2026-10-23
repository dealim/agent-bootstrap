# PRD Agents - {{PROJECT_NAME}}

`memory/prd/`는 프로젝트 요구사항, 제품/업무 맥락, 현재 상태를 기록하는 문서를 보관합니다.

## When To Read

- 작업 시작 시 프로젝트 목적, 범위, 현재 상태를 파악해야 할 때
- 새 기능의 요구사항이나 사용자 흐름을 확인해야 할 때
- 프로젝트 상태, 핵심 경로, 기술 스택이 바뀌었는지 확인해야 할 때
- UI 작업 전에는 [DESIGN.md](DESIGN.md)와 해당 기능 PRD의 `User Experience`를 함께 읽습니다. 공통 원칙만으로 화면별 요구사항을 추측하지 않습니다.

## File Rules

- 프로젝트 전체 컨텍스트는 `PROJECT.md`로 작성합니다.
- 기능별 요구사항은 `YYYY-MM-DD-feature-name.md` 형식으로 작성합니다.
- 파일명은 소문자 kebab-case를 사용합니다.
- 오래된 요구사항을 덮어쓰지 말고, 변경 이력이 중요하면 새 문서를 추가합니다.
- [DESIGN.md](DESIGN.md)는 공통 디자인 원칙, 접근성·반응형 기준, UI 프레임워크·컴포넌트 재사용 규칙만 관리합니다. 기능별 화면 구성, 버튼 문구, 사용자 흐름, 화면별 상태는 해당 기능 PRD에 작성합니다.
- `DESIGN.md`에는 아래 기능 PRD 템플릿을 적용하지 않습니다. 기존 앱에 디자인 원칙 문서가 있으면 중복 생성하지 않고 기존 문서를 보존·통합하며 링크를 갱신합니다.

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

## User Experience

UI 변경이 있는 기능에 필수이며, UI 변경이 없으면 생략할 수 있습니다.

- 사용자의 진입부터 결과 확인까지의 흐름
- 화면 구성과 정보 우선순위, 주요·보조 행동
- 실제 제목, 버튼 문구, 입력 안내
- 화면별 로딩·빈 상태·오류·성공 피드백
- 관련 화면 크기, 키보드·보조 기술 등 접근성 요구사항
- 사용자 행동과 관찰 가능한 결과로 작성한 실제 UI 검증 시나리오

공통 원칙은 DESIGN.md를 참조하고, 상세한 다중 화면 명세는 기능 범위 문서로 분리해 연결합니다.

## Current State

현재 구현 상태, 핵심 경로, 관련 시스템을 기록합니다.

## References

- 관련 문서, 이슈, ADR, 계획서 링크
```

## Recording Rules

- 확정된 기술 결정은 `memory/adr/`에 기록합니다.
- 버그와 장애 이력은 `memory/issues/`에 기록합니다.
- 구현 전 계획과 실행 step은 `plans/YYYY-MM-DD-{plan-name}/`에 작성합니다.
