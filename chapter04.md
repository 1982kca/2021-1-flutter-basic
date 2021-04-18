플러터 프로젝트 훑어보기    
===

자, 이제 본격적으로 플러터를 공부해봅시다.    
첫 시간에 플러터 개발 환경을 구축한 뒤로 플러터는 건드리지 않고 있었죠?    
이번 시간에는 첫 시간에 과제로 생성한 샘플 앱을 살펴보도록 하겠습니다.

샘플 앱 디렉토리를 확인해보면 다음과 같은 파일 및 디렉토리가 있음을 확인할 수 있습니다.

```
sample_app
├── android/...
├── build/...
├── .dart_tool/...
├── .gitignore
├── .idea/...
├── ios/...
├── lib/...
├── .metadata
├── .packages
├── pubspec.lock
├── pubspec.yaml
├── README.md
├── sample_app.iml
└── test/...
```

하위 디렉토리 내부는 생략하고 프로젝트 루트에 있는 것들만 나타냈습니다.

여기서 `.idea` 디렉토리와 `sample_app.iml` 파일은 플러터에 의해 생성된다기 보다는 IDE에 의해 생성된 것이며, Mac 사용자의 경우 추가적으로 `.DS_Store` 라는 녀석도 생성될 것입니다.    

이들을 제외한 디렉토리 및 파일은 다음과 같습니다.

|이름|종류|설명|관리|
|:-:|:-:|:-:|:-:|
|`android`|디렉토리|안드로이드 프로젝트 관련 파일을 모아두는 디렉토리로, 안드로이드 네이티브와 소통할 때 필요|수동|
|`build`|디렉토리|빌드 시 생성되는 파일이 저장되는 디렉토리|자동|
|`.dart_tool`|디렉토리|Dart 의존성 관리를 위한 디렉토리|자동|
|`ios`|디렉토리|iOS 프로젝트 관련 파일을 모아두는 디렉토리로, iOS 네이티브와 소통할 때 필요|수동|
|`lib`|디렉토리|플러터 앱 코드 베이스 파일을 모아두는 디렉토리로, 실제적인 코드 작성이 이루어지는 곳|수동|
|`test`|디렉토리|앱 개발 도중 테스트를 할 때 사용하는 파일을 모아두는 디렉토리|수동|
|`.gitignore`|파일|Git에 commit하지 않을 파일들의 정보를 담고 있는 파일|수동|
|`.metadata`|파일|Flutter SDK 정보를 담고 있는 파일|자동|
|`.packages`|파일|Flutter SDK에 사용하는 기본 패키지 경로를 담고 있는 파일|자동|
|`pubspec.lock`|파일|`pubspec.yaml` 파일의 정보에 대한 구제적인 버전 정보를 담고 있는 파일|자동|
|`pubspec.yaml`|파일|의존성 패키지, 이미지, 폰트 등의 정보를 담고 있는 파일|수동|
|`README.md`|파일|프로젝트에 대한 설명을 작성하는 파일|수동|

일단 기본적으로 `pubspec.yaml` 파일과 `lib` 디렉토리만 알면 충분합니다.    

`pubspec.yaml` 파일 살펴보기
---

`pubspec.yaml` 파일에는 앱 이름이 무엇인지(`name`), 어떤 앱인지(`description`), 그리고 앱의 버전은 몇이며(`version`) Flutter SDK 버전은 몇과 호환되는지(`environment`) 등의 정보가 들어 있습니다.    
그리고 외부 패키지를 사용할 경우 `dependencies` 에 어떤 패키지의 어떤 버전을 사용할지 의존성 정보를 명시해주어야 하죠.    
패키지 버전에 따라 잘 호환되지 않는 경우가 있을 수 있어 버전 정보를 잘 명시해주어야 합니다.     
~~버전을 명시하지 않을 경우 당장은 문제가 발생하지 않아도 언젠가 예측하지 못한 버그를 야기할 수 있음을 유의합시다.~~    

앱에 어떤 이미지 파일을 넣거나 기본 폰트가 아닌 다른 폰트를 사용하고자 하는 경우에도 이 파일에 작성해야 합니다.

의존성과 이미지, 폰트 등의 명시 방법은 그것을 사용할 때 좀 더 자세히 알아보도록 하겠습니다.    

`lib` 디렉토리 살펴보기
---

`lib` 디렉토리를 확인해보면 `main.dart` 라는 이름의 파일이 자동으로 생성되어 있는 것을 확인할 수 있습니다.    
이 파일에 작성되어 있는 `main` 함수가 앱의 시작 지점이죠.    
`main` 함수에서 호출하는 `runApp` 함수를 통해 플러터 앱이 실행됩니다.    
`runApp` 함수는 플러터 앱을 시작하면서 화면에 표시할 위젯을 인자로 전달 받는데, 여기서는 `MyApp` 이라는 이름의 위젯이 전달되었습니다.    

> **위젯 _widget_**    
위젯은 플러터 앱에서 화면을 구성하는 기본 단위입니다.    
플러터 앱의 모든 것은 위젯으로 이루어져 있으며 앱 자체도 위젯입니다.    
텍스트를 담기 위한 `Text` 위젯, 다른 위젯을 가로로 배치하기 위한 `Row` 위젯, 다른 위젯을 세로로 배치하기 위한 `Column` 위젯 등 다양한 위젯이 존재합니다.    

`main` 함수가 정의되기 전에 다음과 같이 적혀 있는 것을 확인할 수 있는데,

```dart
import 'package:flutter/material.dart';
```

`import` 는 외부 패키지나 프로젝트 상의 다른 소스 파일의 코드를 사용하고자 할 때 사용하는 구문입니다.    
`material.dart` 는 플러터 내장 패키지 중 하나로, UI와 관련된 다양한 클래스가 정의되어 있습니다.    
플러터에서 제공하는 위젯들을 사용하기 위해 필요하다고 알아두면 됩니다.    

`MyApp` 클래스는 `StatelessWidget` 클래스를 상속받아 작성되었습니다.    
`StatelessWidget` 은 상태가 변경되지 않는 위젯인데, 이에 대해서는 잠시 후에 알아보도록 하겠습니다.    
이 클래스는 `MaterialApp` 을 반환하는데, 이것은 인자로 전달된 제목(`title`), 테마(`theme`) 등의 값에 따라 화면을 구성합니다.    
그리고 `home` 으로 전달한 위젯을 화면에 띄우는데 여기선 `StatefulWidget` 클래스를 상속받아 작성된 `MyHomePage` 가 전달되었습니다.    
`StatefulWidget` 은 `StatelessWidget` 과 달리 상태가 변하는 위젯으로, 앱이 위젯의 상태를 감시하고 있다가 그것이 변화하면 이에 따른 처리를 수행하죠.    
이 때, 상태 변화를 감시하는 것은 `StatefulWidget` 에서 수행하지만 실제 화면을 갱신하는 것은 `State` 에서 수행합니다.    
이는 화면 갱신 작업이 자원을 더 많이 소모하고 무겁기 때문에 그것과 관련된 녀석은 필요한 순간에만 실행되도록 하기 위함입니다.    
`MyHomePage` 의 `State` 는 이 파일 내에서 `MyHomePage` 만을 위해 사용되기 때문에 식별자 앞에 `_` 를 붙여 private으로 `_MyHomePageState` 라고 작성되었습니다.    

클래스들에는 `createState`, `build` 등의 함수가 재정의되어 있습니다.    
이 함수들에 대해서는 상태에 대해 다루며 알아보도록 하겠습니다.

상태와 생명주기
---

각 위젯은 생명주기를 가지고 있어 이를 통해 앱의 동작이나 자원을 효과적으로 관리합니다.    
위젯의 생명주기는 상태가 변경되는 위젯인지 여부에 따라 차이가 있습니다.

상태가 변경되지 않는 위젯 `StatelessWidget` 의 경우 한 번 생성되면 갱신되지 않으므로 이렇다 할 생명주기가 없습니다.    
그저 다른 화면으로 넘어가면 즉시 로직이 종료되죠.     

반면 상태가 변경되는 위젯 `StatefulWidget` 은 생명주기를 따라 변화합니다.    
지금부터 그 생명주기를 차례대로 알아보도록 하죠.

생명주기는 기본적으로 [createState](https://api.flutter.dev/flutter/widgets/StatefulWidget/createState.html) - [initState](https://api.flutter.dev/flutter/widgets/State/initState.html) - [didChangeDependencies](https://api.flutter.dev/flutter/widgets/State/didChangeDependencies.html) - [build](https://api.flutter.dev/flutter/widgets/State/build.html) - [didUpdateWidget](https://api.flutter.dev/flutter/widgets/State/didUpdateWidget.html) - [setState](https://api.flutter.dev/flutter/widgets/State/setState.html) - [deactivate](https://api.flutter.dev/flutter/widgets/State/deactivate.html) - [dispose](https://api.flutter.dev/flutter/widgets/State/dispose.html)의 흐름으로 진행되며, 생명주기 밖에 있지만 [resassemble](https://api.flutter.dev/flutter/widgets/State/reassemble.html) 함수도 함께 알아두면 좋습니다.    
각각의 이름을 클릭하면 공식 문서의 설명 페이지로 이동하실 수 있습니다. ~~영어에요~~

### createState

`createState` 함수는 `StatefulWidget` 을 상속받는 클래스가 반드시 재정의해야 하는 함수로, 위젯의 상태를 생성하여 `State` 클래스를 반환합니다.    
`State` 클래스에는 `createState` 를 제외한 나머지 생명주기 함수가 들어 있죠.    

이 녀석이 호출되고 상태가 정상적으로 생성되면 `State` 클래스의 read-only 속성인 `bool mounted` 가 `true` 가 되며, 이 때부터 위젯을 제어할 수 있는 `buildContext context` 속성에 접근할 수 있게 됩니다.    
따라서 위젯을 보다 안전하게 사용하기 위해서 `if (mounted)` 조건문 내에 위젯과 관려된 코드를 작성하기도 합니다.    

이것은 새로 할당된 `State` 클래스를 반환하기 때문에 "새로 할당된 객체를 반환"하는 함수에 붙는 `@factory` 어노테이션이 붙어 있습니다.

앞서 살펴본 샘플 앱의 `MyHomePage` 클래스에서는 `State<MyHomePage>` 를 상속받는 `_MyHomePageState` 를 생성하여 반환하도록 재정의되어 있죠.

```dart
@protected
@factory
State createState();
```
### initState

`initState` 함수는 위젯을 초기화할 때 단 한 번 호출되는 함수입니다.    
주로 위젯에 필요한 자료를 준비하는 코드를 이 함수 내에 작성하죠.    
가령 공공API에서 어떤 자료를 받아와 화면에 띄워주고자 한다면, 공공API에 데이터를 요청하고 이를 받아오는 코드가 이 안에 작성되죠.    

이것은 반드시 재정의해야 하는 함수는 아니지만, `@mustCallSuper` 어노테이션이 붙어 있어 재정의할 경우 반드시 내부에서 `super.initState();` 와 같이 부모 클래스의 함수를 호출해주어야 합니다.    
일반적으로 부모 클래스의 함수를 호출한 후 기능을 구현하죠.

```dart
@protected
@mustCallSuper
void initState() {
  assert(_debugLifecycleState == _StateLifecycle.created);
}
```

### didChangeDependencies

`didChangeDependencies` 함수는 데이터 의존성과 관련된 함수로, `initState` 함수가 호출된 후에 호출되며, 위젯이 어떤 데이터에 의존하고 있다면 해당 데이터 객체가 호출될 때마다 호출됩니다.    

이 녀석도 반드시 재정의해야 하는 함수는 아니지만, `@mustCallSuper` 어노테이션이 붙어 있어 재정의할 경우 반드시 내부에서 `super.didChangeDependencies();` 와 같이 부모 클래스의 함수를 호출해주어야 합니다.    
일반적으로 기능을 구현한 후에 부모 클래스의 함수를 호출하죠.

사실 이 녀석이 호출된 직후엔 항상 `build` 가 호출되기 때문에 굳이 이 녀석을 재정의하지 않고 `build` 에서 필요한 기능을 모두 구현하는 경우가 많습니다.

```dart
@protected
@mustCallSuper
void didChangeDependencies() { }
```

### build

`build` 함수는 위젯을 화면에 렌더링하는 함수로, 부모 클래스에서 선언만 되고 그 내용이 정의되지 않은 abstract이기에 반드시 재정의해주어야 합니다.    
이 녀석은 `Widget` 자료형을 반환하는데 이것이 바로 화면에 렌더링할 위젯입니다.    
위젯이 플러터 구성 트리에서 빌드될 위치 등의 정보를 담고 있는 `BuildContext context` 를 인자로 받아 사용하죠.

앞서 살펴본 샘플 앱의 `_MyHomePageState` 클래스에서는 `Scaffold` 위젯에 여러 인자를 전달하여 반환합니다.    
그리고 이 `Scaffold` 가 화면에 보이는 거죠.

`build` 함수는 `State` 클래스뿐만 아니라 `StatelessWidget` 클래스에도 존재하는데, 그 역할은 동일합니다.    
앞서 살펴본 샘플 앱의 `MyApp` 클래스에서는 `MaterialApp` 위젯에 여러 인자를 전달하여 반환합니다.    

```dart
@protected
Widget build(BuildContext context);
```

### didUpdateWidget

`didUpdateWidget` 함수는 특정 이벤트에 의해 부모 위젯이나 데이터가 변경되어 위젯을 갱신해야 할 때 호출됩니다.
갱신되기 전의 위젯 `convariant T oldWidget` 을 인자로 받아 갱신할 부분을 갱신하죠.

이것은 위젯을 다시 만들어야 할 때 `initState` 부터 다시 하지 않고 기존 위젯을 재사용하기 위한 목적으로 사용됩니다.

이것은 반드시 재정의해야 하는 함수는 아니지만, `@mustCallSuper` 어노테이션이 붙어 있어 재정의할 경우 반드시 내부에서 `super.didUpdateWidget(oldWidget);` 와 같이 부모 클래스의 함수를 호출해주어야 합니다.    
일반적으로 부모 클래스의 함수를 호출한 후 기능을 구현하죠.

```dart
@mustCallSuper
@protected
void didUpdateWidget(covariant T oldWidget) { }
```

### setState

`setState` 함수는 위젯의 상태를 갱신하는 함수로, 재정의 해놓으면 적절한 순간에 자동으로 호출되는 다른 생명주기 함수와 달리 따로 재정의하지 않고 필요한 순간에 직접ㅈ 호출해주어야 합니다.    
이 함수의 인자로 위젯의 상태를 갱신하는 코드가 콜백함수 `VoidCallback fn` 으로 전달되죠.    

콜백함수를 설정하지 않고 호출할 경우 오류가 발생합니다.    
이 외에도 다양한 오류 상황에 대한 예외처리가 `setState` 함수 내부에 구현되어 있습니다.    
인자로 전달되는 콜백함수는 보통 `() {}` 형태의 익명 함수나 `() => 람다식` 형태의 람다식으로 작성됩니다.

```dart
@protected
void setState(VoidCallback fn) {
  assert(fn != null);
  assert(() {
    if (_debugLifecycleState == _StateLifecycle.defunct) {
      throw FlutterError.fromParts(<DiagnosticsNode>[
        ErrorSummary('setState() called after dispose(): $this'),
        ErrorDescription(
          'This error happens if you call setState() on a State object for a widget that '
          'no longer appears in the widget tree (e.g., whose parent widget no longer '
          'includes the widget in its build). This error can occur when code calls '
          'setState() from a timer or an animation callback.'
        ),
        ErrorHint(
          'The preferred solution is '
          'to cancel the timer or stop listening to the animation in the dispose() '
          'callback. Another solution is to check the "mounted" property of this '
          'object before calling setState() to ensure the object is still in the '
          'tree.'
        ),
        ErrorHint(
          'This error might indicate a memory leak if setState() is being called '
          'because another object is retaining a reference to this State object '
          'after it has been removed from the tree. To avoid memory leaks, '
          'consider breaking the reference to this object during dispose().'
        ),
      ]);
    }
    if (_debugLifecycleState == _StateLifecycle.created && !mounted) {
      throw FlutterError.fromParts(<DiagnosticsNode>[
        ErrorSummary('setState() called in constructor: $this'),
        ErrorHint(
          'This happens when you call setState() on a State object for a widget that '
          "hasn't been inserted into the widget tree yet. It is not necessary to call "
          'setState() in the constructor, since the state is already assumed to be dirty '
          'when it is initially created.'
        ),
      ]);
    }
    return true;
  }());
  final dynamic result = fn() as dynamic;
  assert(() {
    if (result is Future) {
      throw FlutterError.fromParts(<DiagnosticsNode>[
        ErrorSummary('setState() callback argument returned a Future.'),
        ErrorDescription(
          'The setState() method on $this was called with a closure or method that '
          'returned a Future. Maybe it is marked as "async".'
        ),
        ErrorHint(
          'Instead of performing asynchronous work inside a call to setState(), first '
          'execute the work (without updating the widget state), and then synchronously '
         'update the state inside a call to setState().'
        ),
      ]);
    }
    // We ignore other types of return values so that you can do things like:
    //   setState(() => x = 3);
    return true;
  }());
  _element!.markNeedsBuild();
}
```

### deactivate

`deactivate` 함수는 `State` 객체가 플러터 구성 트리로부터 제거될 때 호출되는 함수입니다.    

이 함수가 호출되었을 때 단지 구성 트리로부터 제거되기만 할 뿐, `State` 객체 메모리 자체가 지워지지는 않아, 해당 객체를 재사용할 수 있습니다.    

이것은 반드시 재정의해야 하는 함수는 아니지만, `@mustCallSuper` 어노테이션이 붙어 있어 재정의할 경우 반드시 내부에서 `super.deactivate();` 와 같이 부모 클래스의 함수를 호출해주어야 합니다.    
일반적으로 기능을 구현한 후에 부모 클래스의 함수를 호출하죠.

```dart
@protected
@mustCallSuper
void deactivate() { }
```

### dispose

`dispose` 함수는 해당 위젯을 종료할 때 호출되며, `State` 객체를 소멸합니다.    
이 녀석이 호출되고 나면 재사용할 수 없게 되죠.    

위젯이 소멸될 때 반드시 함께 제거되어야 하는 객체라던가 반드시 처리되어야 하는 루틴이 있다면 이 함수 내에 작성합니다.

이 함수가 호출되면 `State` 클래스의 read-only 속성인 `bool mounted` 가 `false` 가 되며, 이 때부터 위젯을 제어할 수 있는 `buildContext context` 속성에 더 이상 접근할 수 없게 됩니다.    
이 상태에서 `setState` 호출을 시도하면 오류가 발생하죠.

이것은 반드시 재정의해야 하는 함수는 아니지만, `@mustCallSuper` 어노테이션이 붙어 있어 재정의할 경우 반드시 내부에서 `super.dispose();` 와 같이 부모 클래스의 함수를 호출해주어야 합니다.    
일반적으로 기능을 구현한 후에 부모 클래스의 함수를 호출하죠.

```dart
@protected
@mustCallSuper
void dispose() {
  assert(_debugLifecycleState == _StateLifecycle.ready);
  assert(() {
    _debugLifecycleState = _StateLifecycle.defunct;
    return true;
  }());
}
```


### resassemble

`reassemble` 함수는 생명주기 함수에 포함되어 있지 않지만 `State` 클래스에 존재하는 함수로, 디버깅 모드에서 플러터 앱이 다시 로드될 때 호출됩니다.    
앱이 다시 로드될 때 `build` 함수도 다시 호출되기 때문에 일반적으로 `reassmeble` 함수에서는 특별히 따로 해주어야 할 작업이 없긴 하지만, 핫 리로드 시 해주고 싶은 작업이 있다면 여기에 작성하면 됩니다.

이것은 반드시 재정의해야 하는 함수는 아니지만, `@mustCallSuper` 어노테이션이 붙어 있어 재정의할 경우 반드시 내부에서 `super.reassemble();` 와 같이 부모 클래스의 함수를 호출해주어야 합니다.    
일반적으로 기능을 구현한 후에 부모 클래스의 함수를 호출하죠.

```dart
@protected
@mustCallSuper
void reassemble() { }
```

과제
---

이번 과제에는 코딩 실습이 포함되지 않습니다!    

이번 과제는 플러터의 상태와 생명주기에 대해 직접 정리해보는 것입니다.    
글로 정리해도 좋고 표로 정리해도 좋고 그림으로 정리해도 좋습니다.    
단순한 텍스트 파일부터 종이에 작성해서 촬영 또는 스캔하는 것 등 포맷도 상관 없습니다.   
(다만, hwp 파일은 허용하지 않습니다. 저도 열어보고 싶거든요...ㅋ)

