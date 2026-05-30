# Known Issues & Gotchas - {{PROJECT_NAME}}

> **역할**: 에이전트가 반복적으로 부딪히는 함정(gotcha)과 현재 미해결 이슈를 기록합니다.
> **읽기 시점**: 버그 수정, 장애 대응, 유사 이슈 조사 시 읽습니다.
>
> **Living Document 원칙**:
> - 해결되어 더 이상 의미 없는 이슈는 **삭제**합니다 (히스토리는 git이 보관).
> - 해결되었지만 **다른 에이전트가 또 빠질 수 있는 함정**은 남겨둡니다.
> - 반복 패턴이 확인되면 [decisions.md](decisions.md)로 승격합니다.

---

<!-- 예시:

## [Frontend / UI]

### AI 버튼이 특정 레이아웃에서 미노출
`detail` 레이아웃에는 `<AiFloatingButton />`이 없음. `default.vue`에만 정의되어 있으므로
새 레이아웃을 만들 때 반드시 해당 컴포넌트를 포함해야 함.

## [Deployment / Infra]

### Registry 푸시 누락 시 Pod 이미지 불일치
로컬에서 빌드만 하고 Registry에 푸시하지 않으면 K8s Pod가 이전 이미지를 계속 사용함.
빌드 후 반드시 `docker push` 또는 Jenkins 빌드를 통해 Registry에 반영할 것.

-->
