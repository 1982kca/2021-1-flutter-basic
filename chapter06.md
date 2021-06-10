이미지와 폰트
===

플러터 앱은 단순히 위젯들로만 구성할 수도 있지만, 이미지를 넣거나 텍스트의 폰트를 변경하는 등의 방식으로 꾸밀 수 있습니다.    
플러터에서 이미지와 폰트를 사용하기 위해서는 설정 파일인 `pubspec.yaml` 에 사용할 이미지 및 폰트를 명시해주어야 합니다.

자동으로 생성된 `pubspec.yaml` 파일의 하단부에 다음과 같은 주석이 있음을 확인할 수 있습니다.

```yaml
# 앞부분 생략

flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true

  # To add assets to your application, add an assets section, like this:
  # assets:
  #   - images/a_dot_burr.jpeg
  #   - images/a_dot_ham.jpeg

  # An image asset can refer to one or more resolution-specific "variants", see
  # https://flutter.dev/assets-and-images/#resolution-aware.

  # For details regarding adding assets from package dependencies, see
  # https://flutter.dev/assets-and-images/#from-packages

  # To add custom fonts to your application, add a fonts section here,
  # in this "flutter" section. Each entry in this list should have a
  # "family" key with the font family name, and a "fonts" key with a
  # list giving the asset and other descriptors for the font. For
  # example:
  # fonts:
  #   - family: Schyler
  #     fonts:
  #       - asset: fonts/Schyler-Regular.ttf
  #       - asset: fonts/Schyler-Italic.ttf
  #         style: italic
  #   - family: Trajan Pro
  #     fonts:
  #       - asset: fonts/TrajanPro.ttf
  #       - asset: fonts/TrajanPro_Bold.ttf
  #         weight: 700
  #
  # For details regarding fonts from package dependencies,
  # see https://flutter.dev/custom-fonts/#from-packages

```

이곳이 이미지와 폰트를 등록하는 곳입니다.

실습을 위한 준비
---

실습을 하기 위해 새로운 플러터 프로젝트를 생성해봅시다.    
VSC 상단 메뉴바의 `View > Command Palette...` 버튼을 누르거나 `ctrl + shift + p` 를 눌러 커멘드 파레트를 열고, 다음과 같은 명령어를 실행합니다.

```
> Flutter: New Application Project
```

플러터 앱 프로젝트를 생성할 디렉토리를 선택하고 `assets_example` 라는 이름의 프로젝트를 생성합시다.

이미지 사용하기
---

앱에서 이미지를 사용하기 위해 이미지를 모아놓을 디렉토리를 생성하도록 하겠습니다.      
프로젝트 루트에 `images` 라는 이름의 디렉토리를 생성합니다.    

그리고 그 안에 이미지 파일을 몇 개 집어넣겠습니다.
다음의 세 개의 사진 파일을 다운로드 받아 방금 만든 디렉토리에 저장합니다.

![https://github.com/1982kca/2021-1-flutter-basic/blob/main/images/kca-logo.png](https://github.com/1982kca/2021-1-flutter-basic/blob/main/images/kca-logo.png)
![https://github.com/1982kca/2021-1-flutter-basic/blob/main/images/ku-character.png](https://github.com/1982kca/2021-1-flutter-basic/blob/main/images/ku-character.png)
![https://github.com/1982kca/2021-1-flutter-basic/blob/main/images/ku-logo.jpg](https://github.com/1982kca/2021-1-flutter-basic/blob/main/images/ku-logo.jpg)

순서대로 `kca-logo.png`, `ku-character.png`, `ku-logo.jpg` 로 저장하도록 하겠습니다.

```
images/
├── kca-logo.png
├── ku-character.png
└── ku-logo.jpg
```

이 파일들을 앱에서 사용하기 위해 `pubspec.yaml` 파일에 다음과 같이 작성합니다.

```yaml
# 앞부분 생략
flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.

  uses-material-design: true

  assets:
    - images/ku-character.png
    - images/ku-logo.jpg
```

이제 해당 이미지 파일들을 사용할 수 있습니다.    
사용할 수 없을 경우 터미널에서 수동으로 다음 명령어를 실행합니다.

```bash
$ flutter pub get
```

`lib` 디렉토리 아래에 `imageWidget.dart` 파일을 생성한 뒤 다음과 같이 작성합니다.

```dart 
import 'package:flutter/material.dart';

class ImageWidgetApp extends StatefulWidget {
  @override
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidgetApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Image.asset('images/ku-character.png'),
            ),
            Expanded(
              child: Image.asset('images/ku-logo.png'),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
    );
  }
}
```

그리고 `lib/main.dart` 를 다음과 같이 수정합니다.

```dart
import 'package:flutter/material.dart';
import 'imageWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assets Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ImageWidgetApp(),
    );
  }
}
```

이미지 파일이 세로로 일렬로 나타나는 것을 확인할 수 있습니다.

`pubspec.yaml` 파일에 이미지 파일의 경로가 잘못 지정되어 있거나 `Image.asset` 에 이미지 파일 경로가 잘못 지정되어 있다면 실행되지 않으니 오류가 뜬다면 경로를 잘 확인해주세요.    


예제에서는 `Expanded` 위젯을 통해 화면을 벗어나지 않는 한 가득 채우도록 하였으나, `Image.asset` 의 인자로 `width` 과 `height` 를 설정함으로써 이미지 크기를 설정할 수 있습니다.    
만약 이미지 크기가 `width` * `height` 로 떨어지지 않는다면 범위 밖으로 빠져나가는 부분을 자르거나 비율을 무시하고 우겨 넣는 등의 조정 작업을 해줄 수 있는데, 이 때 사용할 수 있는 것이 `fit` 매개변수입니다.    
`fit` 매개변수에는 `BoxFit` 상수를 사용할 수 있습니다.

|옵션|설명|
|:-:|:-:|
|`BoxFit.fill`|`width` 와 `height` 를 가득 채우도록 늘이거나 줄여 그린다|
|`BoxFit.contain`|원본 비율을 유지한 채 이미지가 잘리지 않는 선에서 가장 크게 그린다|
|`BoxFit.cover`|이미지가 잘리더라도 원본 비율을 유지한 채 주어진 범위를 모두 덮도록 그린다|
|`BoxFit.fitWidth`|공간이 남거나 이미지가 잘리더라도 원본 비율을 유지한 채 `width` 값을 채워서 그린다|
|`BoxFit.fitHeight`|공간이 남거나 이미지가 잘리더라도 원본 비율을 유지한 채 `height` 값을 채워서 그린다|
|`BoxFit.none`|공간이 남거나 이미지가 잘리더라도 원본 크기 그대로 그린다|
|`BoxFit.scaleDown`|공간이 남더라도 전체 이미지가 나오도록 원본 크기 이내로 그린다|

폰트 사용하기
---

폰트 `ttf` 또는 `otf` 파일을 가지고 있다면 이미지와 마찬가지로 `fonts` 디렉토리를 생성하여 해당 파일을 그 안에 저장합니다.    
가지고 있는 폰트가 없다고 해도 [Google Fonts](https://fonts.google.com)에서 쉽게 내려받을 수 있습니다.


[Roboto Mono](https://fonts.google.com/specimen/Roboto+Mono) 폰트 패밀리에 속하는 [RobotoMono-Regular.ttf](https://github.com/1982kca/2021-1-flutter-basic/blob/main/fonts/RobotoMono-Regular.ttf) 와 [RobotoMono-Bold.ttf](https://github.com/1982kca/2021-1-flutter-basic/blob/main/fonts/RobotoMono-Bold.ttf) , [RobotoMono-Italic.ttf](https://github.com/1982kca/2021-1-flutter-basic/blob/main/fonts/RobotoMono-Italic.ttf) 를 다운로드 받아 사용한다고 하면,

```
fonts/
├── RobotoMono-Regular.ttf
├── RobotoMono-Bold.ttf
└── RobotoMono-Italic.ttf
```

`pubspec.yaml` 파일에는 다음과 같이 작성합니다.

```yaml
# 앞부분 생략
flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.

  uses-material-design: true

  assets:
    - images/ku-character.png
    - images/ku-logo.jpg

    fonts:
    - family: RobotoMono
      fonts:
        - asset: fonts/RobotoMono-Regular.ttf
        - asset: fonts/RobotoMono-Bold.ttf
          style: bold
        - asset: fonts/RobotoMono-Italic.ttf
          style: italic
```

이제 해당 폰트들을 사용할 수 있습니다.    
사용할 수 없을 경우 터미널에서 수동으로 다음 명령어를 실행합니다.

```bash
$ flutter pub get
```

`lib/imageWidget.dart` 파일에 이미지 사이에 텍스트를 하나 추가하고 폰트를 적용합니다.

```dart
import 'package:flutter/material.dart';

class ImageWidgetApp extends StatefulWidget {
  @override
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidgetApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: <Widget>[
          Expanded(
            child: Image.asset('images/ku-character.png'),
          ),
          Text(
            'Konkuk University',
            style: TextStyle(
              fontFamily: 'RobotoMono',
              fontSize: 24,
            ),
          ),
          Expanded(
            child: Image.asset('images/ku-logo.png'),
          ),
        ], mainAxisAlignment: MainAxisAlignment.center),
      ),
    );
  }
}
```

`TextStyle` 에 `fontWeight: FontWeight.w700` 를 적용하면 Bold체를, `fontStyle: FontStyle.italic` 를 적용하면 Italic체를 사용할 수 있습니다.    

앱 전체에 폰트를 적용하고 싶다면, `main.dart` 의 `build` 가 반환하는 `MaterialApp` 에 `theme` 매개변수로 다음과 같이 전달할 수도 있습니다.

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Assets Example',
      theme: ThemeData(
        fontFamily: 'RobotoMono',
      ),
      home: ImageWidgetApp(),
    );
  }
}
```

폰트를 다운로드 받지 않고 사용하고 싶다면 [`google_fonts`](https://pub.dev/packages/google_fonts) 라이브러리를 사용하는 방법도 있습니다만, 여기선 따로 다루지 않을 것입니다.

과제
---

여러분을 위한 아주 쉬운 과제를 준비했습니다.    
예제에서 사용한 이미지와 폰트가 아닌, 여러분이 좋아하는 이미지와 폰트를 적용해보세요.    
그것이 적용된 플러터 프로젝트를 PR 하시면 됩니다.

<!-- TODO -->
