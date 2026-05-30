# Standards & Workflows - {{PROJECT_NAME}}

> 이 파일은 3단계 메모리입니다.
> 반복적으로 등장하는 패턴이나 프로젝트 전체에 적용되는 **확정된 규칙**만 기록합니다.
> 일시적인 이슈 로그는 [project.md](file://./project.md)에 남깁니다.

---

## Source of Truth

프로젝트의 핵심 소스와 배포 기준을 명시합니다.

| 항목 | 위치 | 비고 |
|------|------|------|
| 소스코드 | *(프로젝트의 메인 소스 경로)* | |
| 설정/환경 | [.env.example](file://../../.env.example) | 환경 변수 템플릿 |
| 에이전트 지침 | [AGENTS.md](file://../../AGENTS.md) | 모든 에이전트의 마스터 규칙 |

---

## Deployment Rules (배포 규칙)

*(프로젝트에 맞는 배포 규칙이 확정되면 여기에 기록합니다)*

<!-- 예시:
### 프론트엔드 배포
1. `npm run build` 로 프로덕션 빌드
2. Docker 이미지 태그: `registry.example.com/app-fe:{version}`
3. `helm upgrade` 명령으로 K8s 배포

### 백엔드 배포
1. Jenkins 빌드 후 자동 푸시
2. 롤백: `kubectl rollout undo deployment/app-api`
-->

## API & Integration Standards (API 연동 표준)

*(외부 API 연동 시 지켜야 할 규칙이 확정되면 여기에 기록합니다)*

<!-- 예시:
### OpenNMS API Proxy
- Nitro 프록시 설정: `nuxt.config.ts` → `nitro.routeRules`
- `/nms/**` → OpenNMS 베이스 경로 (v1 REST + v2 API 모두 지원)
- 특정 API 버전 경로(`/api/v2/`)로 강제 리다이렉트하지 않을 것
-->

## Conventions (코딩 컨벤션)

*(프로젝트 고유의 코딩 규칙이 확정되면 여기에 기록합니다)*

<!-- 예시:
- 컴포넌트 파일명: PascalCase (e.g., `AiFloatingButton.vue`)
- API 엔드포인트: kebab-case (e.g., `/api/data-pipeline`)
- DB 마이그레이션 변경 시 반드시 `migrations/` 디렉토리에 파일 추가
-->
