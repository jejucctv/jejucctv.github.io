# 🗿 Jejudo CCTV 🎦 WebApp

제주도 멀티뷰 CCTV WebApp.

![목표화면](assets/img/prototype-2.png)

## TODO

- [x] initialize
- [x] android web browser test
- [x] ios web browser test
- [x] 가비아 도메인 신청(http://jejucctv.site)
- [x] github page에서 cname 설정
- [x] Github Action 스크립트에서 video_player 패키지의 파일을 교체
- [x] 소스코드 SEO 작업
- [x] naver, google, daum 웹 마스터에 등록
- [x] google 애널리틱스 등록
- [x] favicon 만들기
- [x] footer 만들기

## Bug Fixed

- [ ] ~~iOS 환경에서 Appbar 사라진 후에 복구 안되는 현상~~
- [x] email/link가 동작안하는 현상
- [x] 컨트롤 안보이는 현상
- [ ] ~~hls 지원 브라우저 체크~~
- [ ] ~~재생 안됨 체크~~

## ~~주의(video_player_web_hls 라이브러리를 직접 사용하여 해결)~~

~~Player 컨트롤러는 기본 기능을 사용한다. 때문에 브라우저에서 제공하는 기본 컨트롤러를 활성화 해야 한다. 문제는 기본 컨트롤러는 disable 상태로 사용자가 직접 활성화를 해야한다.~~

~~이를 해결하기 위해 [`video_player`](https://pub.dev/packages/video_player_web)의 소스코드에서 초기화 부분에서 컨트롤러를 활성화한다.~~

```
/// $FLUTTER_HOME\.pub-cache\hosted\pub.dartlang.og\video_player_web-0.1.3+2\lib\video_player_web.dart

void initialize() {
  videoElement = VideoElement()
    ..src = uri
    ..style.border = 'none'
    /// 아래 3줄을 추가
    ..autoplay = true
    ..controls = true
    ..volume = 0;
}
```

## Changelog

### 0.1.1

- ReactJS를 이용하여 재개발

### 0.0.7

- PC (hide controller) / Mobile (show controller)

### 0.0.6

- version.json 파일에서 버전 load

### 0.0.5

- sentry 에러 리포팅 추가

### 0.0.4

- email, url link bug fixed

### 0.0.3

- http://jejucctv.site 도메인 등록
- iOS Player 가능

### 0.0.2

- 16개 채널 동시 시청 가능

### 0.0.1

- Hello Flutter on Web
- Github Action을 이용한 deploy

## favicon license

- https://www.crowdpic.net/@N01end
-
