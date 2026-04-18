# 아침 루틴 브리프 (Morning Routine Brief)

아침에 한 번 보면 **오늘의 날씨 + 챙길 준비물 + 추천 행동**을 빠르게 확인할 수 있는
위젯 중심 서비스입니다.

## 제품 비전
- 사용자가 아침에 반드시 열어보는 습관형 서비스
- 하루 3회 이상 자연스럽게 재진입하는 루틴 도구
- 단순 날씨 조회를 넘어 행동을 유도하는 생활형 앱

## 현재 문서 상태
- PRD 초안 작성 완료: `docs/PRD.md`
- MVP 규칙 초안 작성 완료: `docs/recommendation-rules.md`
- 실행 계획(티켓 분해) 작성 완료: `docs/mvp-tickets.md`

## 디렉터리 구조
```
.
├── README.md
├── docs/
│   ├── PRD.md
│   ├── recommendation-rules.md
│   └── mvp-tickets.md
├── src/
│   └── .gitkeep
├── tests/
│   └── .gitkeep
└── .gitignore
```

## 다음 액션 (개발 직전)
1. 위젯 1안(문구 + 정보 밀도) 확정
2. 알림 3종(아침/출발 전/저녁 예고) 타이밍 고정
3. 추천 규칙 임계값 확정(강수/기온/미세먼지)
4. MVP 티켓 우선순위 확정 후 스프린트 시작
