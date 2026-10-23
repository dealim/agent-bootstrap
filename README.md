# Agent Bootstrap Skeleton

AI 에이전트(Claude, Gemini, Cursor, Codex 등) 기반 소프트웨어 개발을 위한 범용 스켈레톤 프로젝트입니다.
**connex-v3**에서 사용된 에이전트 협업 워크플로우를 일반화하여, 어떤 프로젝트에서든 `git clone` 후 바로 사용할 수 있도록 설계되었습니다.

---

## 📁 Repository Structure

```text
├── AGENTS.md                       # 에이전트 마스터 지침 (엔트리포인트)
├── CLAUDE.md -> AGENTS.md          # Claude용 심볼릭 링크
├── GEMINI.md -> AGENTS.md          # Gemini용 심볼릭 링크
├── .cursorrules                    # Cursor 에디터용 구조화 프롬프트
├── .gitignore
├── .env.example                    # 환경 변수 템플릿
├── setup.sh                        # 프로젝트 초기화 스크립트
└── docs/
    ├── memory/
    │   ├── AGENTS.md               # 장기 지식 라우터
    │   ├── prd/                    # 프로젝트 요구사항, 제품/업무 맥락, 현재 상태
    │   │   ├── AGENTS.md           # PRD 문서 작성 규칙
    │   │   └── DESIGN.md           # 공통 디자인 원칙, 접근성·반응형, UI 재사용 규칙
    │   ├── adr/                    # 확정된 결정, 컨벤션, 배포 규칙
    │   │   └── AGENTS.md           # ADR 문서 작성 규칙
    │   └── issues/                 # 이슈/버그 원인/해결 이력
    │       └── AGENTS.md           # 이슈 문서 작성 규칙
    └── plans/
        ├── AGENTS.md               # dated harness plan 작성 규칙
        ├── TEMPLATE.md             # plan 작성 템플릿
        └── YYYY-MM-DD-plan-name/   # 독립 실행 step 묶음
            ├── index.json
            ├── step0-slug.md
            └── step1-slug.md
```

---

## 🚀 Getting Started

```bash
git clone https://github.com/dealim/agent-bootstrap.git my-new-project
cd my-new-project
./setup.sh "MyProjectName"
```

---

## 🧠 Memory & Plans System

에이전트가 **"지금 뭘 하려는가"**에 따라 필요한 파일만 선택적으로 읽어 토큰을 절약합니다.
장기 지식은 `docs/memory/` 아래에서 `prd`, `adr`, `issues`로 나누어 보관하고, 실행 harness는 `docs/plans/`에 둡니다.
모든 `docs/memory/` 및 `docs/plans/` 디렉토리는 해당 폴더에서 agent가 어떻게 행동해야 하는지 설명하는 `AGENTS.md`를 포함합니다.

### docs/memory/AGENTS.md — 라우터

| 지금 하려는 작업 | 읽을 파일 |
|-----------------|----------|
| 프로젝트 파악, 간단한 질문 | `docs/memory/prd/AGENTS.md` |
| 코드 변경, 새 기능 개발 | `docs/memory/prd/AGENTS.md` + `docs/memory/adr/AGENTS.md` |
| UI 개발·수정 | `docs/memory/prd/AGENTS.md` + `docs/memory/prd/DESIGN.md` + 해당 기능 PRD의 `User Experience` + 관련 ADR |
| 버그 수정, 장애 대응 | `docs/memory/prd/AGENTS.md` + `docs/memory/issues/AGENTS.md` |
| 배포, 인프라 작업 | `docs/memory/prd/AGENTS.md` + `docs/memory/adr/AGENTS.md` |
| plan step 실행 | `docs/plans/YYYY-MM-DD-plan-name/stepN-slug.md`의 `Read First` 목록 |

### prd/ — 항상 읽는 디렉토리
프로젝트 요구사항, 제품/업무 맥락, 핵심 경로, 현재 상태.
**짧고 최신 상태를 유지**합니다. 매 세션 시작 시 반드시 읽습니다.

UI 작업에서는 [DESIGN.md](docs/memory/prd/DESIGN.md)의 공통 디자인·접근성·반응형·UI 재사용 규칙과 기능 PRD의 `User Experience`를 함께 읽습니다. 화면 구성, 버튼 문구, 사용자 흐름, 화면별 상태는 기능 PRD에 기록하고 공통 원칙 문서에 섞지 않습니다. 앱 초기화 시 실제 UI 스택과 공유 컴포넌트 규칙을 `DESIGN.md`에 반영합니다.

### adr/ — 변경 작업 시 읽는 디렉토리
확정된 아키텍처 결정(ADR), 코딩 컨벤션, 배포 규칙.
**변하지 않는 사실만** 기록합니다. `issues/`에서 반복 패턴이 확인되면 승격됩니다.

### issues/ — 디버깅 시 읽는 디렉토리
발견된 이슈, 버그 원인, 해결 이력을 **날짜 역순으로 누적**합니다.
가장 빠르게 커지는 파일이지만, 디버깅할 때만 읽으므로 토큰 낭비가 없습니다.

---

## 📋 Plans

큰 작업이나 아키텍처 변경 전에는 `docs/plans/YYYY-MM-DD-plan-name/`에 plan과 step 파일을 작성하고 유저 승인을 받습니다.
[TEMPLATE.md](docs/plans/TEMPLATE.md) 양식을 사용하고, 각 `stepN-slug.md`는 독립 세션에서 실행 가능하도록 `Read First`, `Task`, `Acceptance Criteria`를 포함합니다.

---

## 📄 License

This bootstrap skeleton is open-source and free to use.
