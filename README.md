# Morning Brief (iOS/Android + Widget)

아침에 일어났을 때 오늘 일정과 날씨 요약을 확인하고,
`우산/마스크` 준비 여부를 추천해 주는 크로스플랫폼 앱 예제입니다.

## 포함 기능

- Flutter 단일 코드베이스(iOS/Android)
- 일정 + 날씨 데이터 요약 화면
- 우산/마스크 추천 룰
- `home_widget` 기반 위젯 데이터 동기화
- Android 위젯 Provider/레이아웃 포함

## 로컬 실행

```bash
flutter pub get
flutter run
```

## 위젯 동작

앱에서 `위젯 포함 새로고침` 버튼을 누르면 아래 키가 위젯에 반영됩니다.

- `recommendation`
- `topSchedule`
- `location`
- `temperatureC`
- `rainProbability`
- `pm25`

## iOS 위젯 설정

`home_widget` 사용을 위해 Xcode에서 Widget Extension 타깃을 만들고,
SwiftUI 뷰에서 App Group 공유 스토리지 값을 읽도록 연결하면 동일한 데이터 키를 사용할 수 있습니다.
(프로젝트별 Team/App Group 설정값이 달라 코드로 고정하지 않았습니다.)
