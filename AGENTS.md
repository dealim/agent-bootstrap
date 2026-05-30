# {{PROJECT_NAME}}

이 파일은 AI 에이전트(Claude, Gemini, Cursor, Codex 등)의 공유 프로젝트 지침 파일입니다.
`CLAUDE.md`와 `GEMINI.md`는 이 파일을 가리키는 심볼릭 링크이며, 모든 에이전트가 동일한 규칙을 따릅니다.

## Scope

- 이 지침은 저장소 전체에 적용됩니다.
- 광범위한 리팩토링보다 집중적이고 정확한 변경을 우선합니다.
- 기존 코드 컨벤션과 코드 품질, 가독성을 최우선으로 합니다.

---

## Memory Lifecycle (3단계 메모리 관리)

에이전트의 지식과 의사결정은 아래 3단계를 거쳐 체계적으로 관리됩니다.

### 1단계: 계획 (Plans)

**위치**: `docs/plans/YYYY-MM-DD-[기능명].md`

큰 작업이나 아키텍처 변경을 시작하기 전에 반드시 계획서를 작성하고 유저의 승인을 받습니다.
- [TEMPLATE.md](file://./docs/plans/TEMPLATE.md) 양식을 복사하여 사용합니다.
- 완료된 계획서는 **수정하지 않고** 히스토리로 보존합니다.
- 계획서에서 도출된 핵심 결정사항은 2단계 또는 3단계로 반영합니다.

### 2단계: 발견 기록 (Durable Memory)

**위치**: [.agent-memory/project.md](file://./.agent-memory/project.md)

작업 중 발견한 이슈, 버그 원인, 아키텍처 특이사항을 **날짜별로 누적 기록**합니다.

**분류 기준 (Classification)**:
- **`[Frontend / UI]`**: UI 레이아웃, 컴포넌트, 상태 관리, 런타임/빌드 스크립트 등
- **`[Backend / API]`**: API 엔드포인트, 비즈니스 로직, 데이터베이스 스키마 및 연동 등
- **`[Deployment / Infra]`**: Docker, Kubernetes, Helm 차트, CI/CD 파이프라인, 환경 설정 등
- **`[Core / Architecture]`**: 전역 설정, 공통 모듈, 보안, 패키지 의존성 등

**기록 양식 (Entry Format)**:
```
#### YYYY-MM-DD | AgentName - 제목
- **현상 (Symptom)**: 발생한 문제나 관찰된 현상
- **원인 (Root Cause)**: 기술적 원인 분석
- **해결 (Resolution)**: 구체적인 수정 내용 또는 명령어
```

### 3단계: 영구 가이드 (Standards & Workflows)

**위치**: [.agent-memory/workflows.md](file://./.agent-memory/workflows.md)

2단계에서 반복적으로 등장하는 패턴이나 프로젝트 전체에 적용되는 배포 규칙, API 연동 표준 등을 **영구적인 표준 가이드**로 승격시킵니다.
- 이 파일은 모든 에이전트가 작업 시작 전에 반드시 읽는 **Source of Truth**입니다.
- 일시적인 이슈 로그가 아닌, 확정된 규칙만 기록합니다.

---

## 작업 전 필수 절차

1. [.agent-memory/INDEX.md](file://./.agent-memory/INDEX.md) 읽기
2. 현재 작업과 관련된 메모리 파일 확인
3. `docs/plans/`에 관련 계획서가 있는지 확인
4. 기존 파일 구조와 코드를 먼저 읽고, 추측하지 않기

## Working Rules

- **Surgical Edits**: 작은 범위의 정확한 수정을 합니다. 관련 없는 코드를 리팩토링하지 않습니다.
- **Verify First**: 파일 구조를 확인하고 라이브 코드를 읽은 후 작업합니다.
- **Safety First**:
  - 시크릿, API 토큰, 비밀번호, 머신별 크리덴셜을 절대 커밋하지 않습니다.
  - [.env.example](file://./.env.example)을 참고하여 환경 변수를 사용합니다.
