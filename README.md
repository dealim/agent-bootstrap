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
├── docs/
│   └── plans/                      # 구현 계획서 보관
│       └── TEMPLATE.md             # 계획서 작성 템플릿
└── .agent-memory/                  # 에이전트 공유 메모리
    ├── INDEX.md                    # 라우터: 어떤 파일을 읽을지 안내
    ├── context.md                  # 프로젝트 개요, 기술 스택, 현재 상태
    ├── decisions.md                # 확정된 컨벤션, 배포 규칙, ADR
    └── issues.md                   # 이슈/버그 원인/해결 이력 (날짜 역순 누적)
```

---

## 🚀 Getting Started

```bash
git clone git@github.com:dealim/agent-bootstrap.git my-new-project
cd my-new-project
./setup.sh "MyProjectName"
```

---

## 🧠 Agent Memory System

에이전트가 **"지금 뭘 하려는가"**에 따라 필요한 파일만 선택적으로 읽어 토큰을 절약합니다.

### INDEX.md — 라우터

| 지금 하려는 작업 | 읽을 파일 |
|-----------------|----------|
| 프로젝트 파악, 간단한 질문 | `context.md` |
| 코드 변경, 새 기능 개발 | `context.md` + `decisions.md` |
| 버그 수정, 장애 대응 | `context.md` + `issues.md` |
| 배포, 인프라 작업 | `context.md` + `decisions.md` |

### context.md — 항상 읽는 파일
프로젝트 개요, 기술 스택, 핵심 경로, 현재 상태.
**짧고 최신 상태를 유지**합니다. 매 세션 시작 시 반드시 읽습니다.

### decisions.md — 변경 작업 시 읽는 파일
확정된 아키텍처 결정(ADR), 코딩 컨벤션, 배포 규칙.
**변하지 않는 사실만** 기록합니다. `issues.md`에서 반복 패턴이 확인되면 승격됩니다.

### issues.md — 디버깅 시 읽는 파일
발견된 이슈, 버그 원인, 해결 이력을 **날짜 역순으로 누적**합니다.
가장 빠르게 커지는 파일이지만, 디버깅할 때만 읽으므로 토큰 낭비가 없습니다.

---

## 📋 Plans

큰 작업이나 아키텍처 변경 전에는 `docs/plans/`에 계획서를 작성하고 유저 승인을 받습니다.
[TEMPLATE.md](docs/plans/TEMPLATE.md) 양식을 사용하고, 완료된 계획서는 수정하지 않고 히스토리로 보존합니다.

---

## 📄 License

This bootstrap skeleton is open-source and free to use.
