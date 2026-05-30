# Architecture Decisions - {{PROJECT_NAME}}

> **역할**: 확정된 아키텍처 결정, 코딩 컨벤션, 배포 규칙을 기록합니다.
> **읽기 시점**: 코드 변경, 새 기능 개발, 배포 작업 전에 읽습니다.
> **기록 규칙**: 확정된 사실만 기록합니다. 논의 중이거나 일시적인 내용은 `issues.md`에 남깁니다.

---

## Coding Conventions

*(프로젝트 고유의 코딩 규칙이 확정되면 여기에 기록합니다)*

<!-- 예시:
- 컴포넌트 파일명: PascalCase (e.g., `AiFloatingButton.vue`)
- API 엔드포인트: kebab-case (e.g., `/api/data-pipeline`)
- DB 마이그레이션 변경 시 반드시 `migrations/` 디렉토리에 파일 추가
-->

## Deployment Rules

*(배포 절차가 확정되면 여기에 기록합니다)*

<!-- 예시:
### 프론트엔드
1. `npm run build` → Docker 이미지 빌드
2. 태그: `registry.example.com/app-fe:{version}`
3. `helm upgrade` 로 K8s 배포

### 롤백
- `kubectl rollout undo deployment/app-fe`
-->

## API & Integration Rules

*(외부 API 연동 규칙이 확정되면 여기에 기록합니다)*

<!-- 예시:
### OpenNMS Proxy
- 설정 위치: `nuxt.config.ts` → `nitro.routeRules`
- `/nms/**` → OpenNMS 베이스 경로 (v1 + v2 모두 지원)
-->

## Architecture Decisions Record

*(중요한 기술 결정을 내릴 때마다 아래 형식으로 추가합니다)*

<!-- 예시:
### ADR-001: 상태 관리 라이브러리 선택 (2026-05-30)
- **결정**: Pinia 사용
- **이유**: Nuxt 3 공식 지원, TypeScript 호환성, 경량
- **대안 검토**: Vuex 4 (보일러플레이트 과다), Composables only (복잡한 상태에 부적합)
-->
