# Agent Bootstrap Skeleton

AI 에이전트(Claude, Gemini, Cursor 등) 기반 소프트웨어 개발을 위한 범용 스켈레톤 프로젝트입니다.
**connex-v3**에서 사용된 에이전트 협업 워크플로우를 일반화하여, 어떤 프로젝트에서든 `git clone` 후 바로 사용할 수 있도록 설계되었습니다.

---

## 📁 Repository Structure

```text
├── AGENTS.md                       # 에이전트 마스터 지침 파일 (엔트리포인트)
├── CLAUDE.md -> AGENTS.md          # Claude용 심볼릭 링크
├── GEMINI.md -> AGENTS.md          # Gemini용 심볼릭 링크
├── .cursorrules                    # Cursor 에디터용 구조화 프롬프트 규칙
├── .gitignore                      # 환경 설정, 시스템 파일 무시 규칙
├── .env.example                    # 환경 변수 설정 템플릿
├── setup.sh                        # 프로젝트 초기화 스크립트
├── docs/
│   └── plans/                      # 1단계: 구현 계획서 보관
│       └── TEMPLATE.md             # 계획서 작성 템플릿
└── .agent-memory/                  # 에이전트 공유 메모리
    ├── INDEX.md                    # 메모리 엔트리포인트
    ├── project.md                  # 2단계: 이슈/발견사항 누적 로그
    └── workflows.md               # 3단계: 확정된 배포 규칙/표준 가이드
```

---

## 🚀 Getting Started

### 1. Clone & Initialize
```bash
git clone git@github.com:dealim/agent-bootstrap.git my-new-project
cd my-new-project
./setup.sh "MyProjectName"
```

The script will:
- `{{PROJECT_NAME}}` 플레이스홀더를 프로젝트 이름으로 일괄 치환
- `CLAUDE.md`, `GEMINI.md` 심볼릭 링크 재생성
- Git 히스토리 초기화 여부 선택

---

## 🧠 3-Tier Memory Lifecycle

에이전트의 지식과 의사결정은 3단계를 거쳐 체계적으로 관리됩니다.

```
┌─────────────────┐     완료 후 핵심 발견 기록     ┌──────────────────┐     반복 패턴 승격     ┌──────────────────┐
│  1단계: 계획     │  ──────────────────────────▶  │  2단계: 발견 기록  │  ────────────────▶  │  3단계: 영구 가이드 │
│  docs/plans/    │                               │  project.md      │                     │  workflows.md    │
│                 │                               │                  │                     │                  │
│  작업 전 계획서   │                               │  이슈, 버그 원인,  │                     │  배포 규칙, API 표준│
│  작성 & 유저 승인 │                               │  아키텍처 발견사항  │                     │  코딩 컨벤션       │
└─────────────────┘                               └──────────────────┘                     └──────────────────┘
```

### 1단계: 계획 (Plans)
| 항목 | 내용 |
|------|------|
| **위치** | `docs/plans/YYYY-MM-DD-[기능명].md` |
| **시점** | 큰 작업이나 아키텍처 변경 **이전** |
| **규칙** | [TEMPLATE.md](docs/plans/TEMPLATE.md) 양식 사용, 완료 후 수정 금지 (히스토리 보존) |

### 2단계: 발견 기록 (Durable Memory)
| 항목 | 내용 |
|------|------|
| **위치** | `.agent-memory/project.md` |
| **시점** | 작업 **완료 후** 즉시 |
| **규칙** | 날짜 역순, 카테고리별 분류, 현상/원인/해결 3항목 필수 |

### 3단계: 영구 가이드 (Standards & Workflows)
| 항목 | 내용 |
|------|------|
| **위치** | `.agent-memory/workflows.md` |
| **시점** | 2단계에서 반복 패턴이 확인되었을 때 |
| **규칙** | 확정된 규칙만 기록, 일시적 이슈 로그 금지 |

---

## 📄 License

This bootstrap skeleton is open-source and free to use.
