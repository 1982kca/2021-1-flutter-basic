Dart 훑어보기 上
===

플러터는 Dart 언어를 사용하는 프레임워크입니다.    
따라서 플러터를 다루기 위해서는 Dart 언어에 대한 지식이 필요합니다.    
플러터를 사용하기 위해서 Dart 언어를 완벽하게 숙달해야 하는 것은 아닙니다만, 어느 정도는 익숙해질 필요가 있죠.    
사실 Dart가 아니더라도 어떤 프로그래밍 언어를 공부해보신 적 있다면 플러터를 사용하는 데 큰 어려움이 없을 겁니다.    

이번 시간에는 Dart의 특징을 알아보고, 플러터를 사용하는 데 필요한 Dart 지식을 알아보도록 하겠습니다.    

Dart의 특징
---

Dart 언어는 **모든 자료를 객체로 취급** 합니다.    
객체는 Object를 번역한 단어인데, 사전적 의미로는 '객체'보다는 '사물'에 가깝습니다.    
~~가끔 이런 단어들 있습니다. Object는 객체라기 보다는 사물이고, Abstract는 추상화라기 보다는 요약이고 등등~~

> 사물<sup>1</sup> _事物_    
> 1. 일과 물건을 아울러 이르는 말    
> 2. 사건과 그 목적물     
> 3. 물질세계에 존재하는 구체적이고 개별적인 대상을 통틀어 이르는 말    

객체는 구체적인 어떤 대상을 의미하며, 주로 어떤 속성과 기능을 갖습니다.    
객체에 대한 명확한 정의는 언어와 맥락에 따라 차이가 있을 수 있지만 말이죠.    
아무튼 모든 자료가 객체로 취급되어, 값으로서 대입할 수도 있고, 어떤 기능을 하는 메서드를 호출할 수도 있습니다.    

그리고 C언어와 같은 언어가 그렇듯, **`main` 이라는 이름의 함수로 시작**합니다.    
이 함수의 시작점이 프로그램의 시작이며, 이 함수가 종료되면 프로그램이 종료되죠.    

Dart 언어는 기본적으로 **자료형이 엄격** 하지만, `dynamic` 자료형을 사용할 경우 여러 자료형을 허용할 수 있습니다.    

어떤 언어는 각각의 자료를 함수 내에서만 사용 가능하거나, 클래스 내에서만 사용 가능하거나, 어디에서나 사용 가능하거나 등등 그 자료를 사용할 수 있는 범위를 지정하기 위해 `private`, `public` 과 같은 키워드를 사용하지만, Dart 언어는 이와 같은 키워드를 갖지 않습니다.    
대신, 그 이름만 보고도 사용 가능한 범위를 알 수 있도록 하는 규칙을 갖고 있죠.    
Dart의 **모든 자료의 식별자는 무조건 알파벳 또는 밑줄 문자 `_` 로 시작**하는데, 밑줄 문자 `_` 로 시작하는 자료는 외부에서 접근할 수 없으며 알파벳으로 시작하는 자료는 외부에서 접근할 수 있습니다.    

식별자는 키워드와 겹치는 이름으로 설정할 수 없는데, 키워드는 [다트 개발자 사이트의 키워드 목록](https://dart.dev/guides/language/language-tour#keywords)에서 확인할 수 있습니다.

Dart의 자료형
---

Dart의 주요 자료형은 다음과 같습니다.    

|구분|자료형|설명|
|:-:|:-:|:-:|
|숫자|`int`|정수형 숫자|
|숫자|`double`|실수형 숫자|
|숫자|`num`|정수 또는 실수형 숫자|
|문자열|`String`|텍스트 기반 문자|
|불리언|`bool`|참(`True`) 또는 거짓(`False`)|
|자료형 추론|`var`|입력받은 값에 따라 자료형 결정 (변경 불가)|
|자료형 추론|`dynamic`|입력받은 값에 따라 자료형 추론 (변경 가능)|

그 외에도 자료형은 더 있지만 일단 이 정도만 알아도 충분합니다.    

일반적으로 Dart 언어에서 자료의 이름을 지을 땐 밑줄 문자 `_` 를 사용한 뱀 표기법 _snake case_ 보다는 띄어쓰기가 있어야 할 다음 문자를 대문자로 하는 **낙타 표기법 _camel case_** 을 사용합니다.

어떤 텍스트를 출력할 땐 `print` 함수에 따옴표로 묶인 텍스트를 전달하는데, 큰따옴표인지 작은따옴표인지는 중요하지 않습니다.    
그리고 따옴표 안에 `${표현식}` 형태로 어떤 표현식의 값을 넣을 수 있습니다.

예를 들어 `78` 이라는 값이 들어 있는 정수 `platinum` 을 출력하고자 한다면,

```dart
print('the number is ${platinum}')
```

만약 표현식이 간결한 하나의 자료라면 중괄호는 생략할 수 있습니다.    

```dart
print('the number is $platinum')
```

Dart의 자료는 아무 값도 가지고 있지 않음을 의미하는 `null` 을 가질 수 있는데, 선언 시 자료형 뒤에 `?` 를 적어준 자료만 가능합니다.    
`int number;` 는 `null` 일 수 없고 `int? nullable;` 는 `null` 일 수 있는 것이죠.     
그리고 `?` 가 붙어 `null` 을 허용했는데 어떤 순간에는 해당 자료가 `null` 이어서는 안된다면, 그 상황에서 그 자료 뒤에 `!` 를 붙입니다.    
`!` 가 붙은 자료는 `null` 이 아닐 경우 잘 실행되지만 `null` 인 경우 에러가 발생합니다.    
`int? nullable;` 라고 선언해놓고 어딘가에서 `nullable!` 로 사용하면, 그 순간에 `null` 일 경우 에러가 발생하는 것이죠.

조건문과 반복문
---

기본적으로 프로그램은 위에서부터 아래로 차례대로 실행됩니다.    
C언어와 같은 절차지향 프로그래밍 언어의 경우 처음부터 끝까지 정해진 순서에 따라 실행되며, Java와 같은 객체지향 프로그래밍 언어의 경우 각 객체들의 상호작용을 기반으로 하되, 그 세부적인 기능은 역시 코드가 작성된 순서대로 실행됩니다.    

그런데 경우에 따라서는 단지 순차적으로 실행되는 게 아니라 조건에 따라 실행되거나 반복적으로 실행될 필요가 있는 경우도 있습니다.    
이런 경우에 사용되는 것이 조건문과 반복문입니다.

**조건문 _conditional_** 은 크게 세 가지가 있는데 `if-else` , `switch` , `alert` 입니다.    

`if-else` 는 어떤 조건과 함께 사용되며 그 조건이 참이 되는 경우에는 `if` 의 코드블럭에 위치하는 코드를, 거짓이 되느 경우에는 `else` 의 코드블럭에 위치하는 코드를 실행합니다.    

```dart
if (조건) {
    // 주어진 조건이 참일 경우
    // 여기에 작성된 코드 실행
} else {
    // 주어진 조건이 거짓일 경우
    // 여기에 작성된 코드 실행
}
```

참인 경우에만 실행하며 거짓인 경우에 대한 처리가 필요하지 않다면 `else` 키워드와 해당 코드블럭을 생략할 수 있습니다.

```dart
if (조건) {
    // 주어진 조건이 참일 경우
    // 여기에 작성된 코드 실행
}
```

그리고 어떤 조건이 거짓일 때 다른 조건을 확인하고 싶다면 다믕과 같이 연쇄적으로 사용할 수도 있습니다.

```dart
if (조건) {
    // 주어진 조건이 참일 경우
    // 여기에 작성된 코드 실행
} else if (조건2) {
    // 주어진 조건이 거짓이며 조건2는 참인 경우
    // 여기에 작성된 코드 실행
} else {
    // 주어진 조건과 조건2가 거짓일 경우
    // 여기에 작성된 코드 실행
}
```

또한 다음과 같이 중첩해서 사용하는 것도 가능하죠.

```dart
if (조건) {
    // 주어진 조건이 참일 경우
    // 여기에 작성된 코드 실행
    if (조건2) {
        // 주어진 조긴이 참이며 조건2도 참인 경우
        // 여기에 작성한 코드 실행
    } else {
        // 주어진 조건이 참이며 조건2는 거짓인 경우
        // 여기에 작성한 코드 실행
    }
} else {
    // 주어진 조건이 거짓일 경우
    // 여기에 작성된 코드 실행
    if (조건3) {
        // 주어진 조긴이 거짓이며 조건3은 참인 경우
        // 여기에 작성한 코드 실행
    } else {
        // 주어진 조건이 거짓이며 조건3도 거짓인 경우
        // 여기에 작성한 코드 실행
    }
}
```

간단한 조건문은 `if-else` 를 사용할 수 있지만 조건이 다양해지면 `if-else if-else` 를 통해 조건문을 작성하기 복잡해집니다.    
만약 특정 자료의 값에 따른 조건을 가진 경우라면 `switch` 를 사용할 수 있습니다.    
`switch` 는 자료의 값과 일치하는 case의 코드를 실행합니다.    

 ```dart
switch (자료) {
    case 값1:
        // 자료의 값이 값1인 경우
        // 여기에 작성된 코드 실행
        break;
    case 값2:
        // 자료의 값이 값2인 경우
        // 여기에 작성된 코드 실행
        break;
    case 값3:
        // 자료의 값이 값3인 경우
        // 여기에 작성된 코드 실행
        break;
    default:
        // 자료의 값이 앞서 언급된 것 중 그 무엇도 아닌 경우
        // 여기에 작성된 코드 실행
        break;
}
 ```

`break` 는 `switch` 문을 벗어나는 키워드로, 이게 없다면 다음 case에 대한 코드까지 이어서 실행된다는 점을 유의합시다.    

그리고 Dart에는 `assert` 라는 조건문이 있는데, 이것은 조건을 만족하지 않으면 에러가 발생합니다.    
이 에러는 `try-catch` 를 통해 예외 처리 할 수 있습니다.

```dart
try {
    assert(조건);
    // 조건이 참일 경우 마저 실행
} catch(e) {
    // 조건이 거짓일 경우
    // 여기에 작성된 코드 실행
} finally {
    // 조건의 참 거짓 여부와 상관 없이
    // 여기에 작성된 코드 실행
}
```

이것은 특별한 경우가 아니면 참이 되는 경우에 사용되며, 그 특별한 경우에 대한 처리를 하기 위해 사용됩니다.     

**반복문 _iteration_** 도 세 가지가 있으며 `for`, `while`, `do-while` 입니다.    

`for` 는 정해진 횟수만큼 반복을 하고자 할 때 유용합니다.

```dart
for (초기화; 조건식; 증감식) {
    // 최초로 한 번 초기화 수행
    // 코드블록의 끝에 도달하면 증감식 수행
    // 조건식이 참이라면 코드블럭의 처음부터 다시 수행
    // 조건식이 거짓이라면 코드블럭을 빠져 나옴
}
```

예를 들어, 10번 반복하고자 할 땐 `for (int i = 0; i < 10; i++)` 와 같이 작성합니다.    
그러면 `i` 가 0으로 시작하여 반복할 때마다 1, 2, ... 증가하여 9일 때까지 실행되고, 10이 되면 반복문을 빠져나가죠.    

만약 초기값이 조건식을 만족하지 않는다면 단 한 번도 실행하지 않은 채 넘어갑니다.    

`while` 은 특정 조건 하에 반복을 하고자 할 때 유용합니다.    

```dart
while(조건) {
    // 조건이 참이라면 여기에 작성된 코드 실행
    // 코드블럭의 끝에 도달하면 조건이 참인지 검사
    // 조건이 참이라면 코드블럭의 처음부터 다시 수행
    // 조건이 거짓이라면 코드블럭을 빠져 나옴
}
```

만약 처음부터 조건이 거짓이라면 단 한 번도 실행하지 않은 채 넘어갑니다.    

`do-while` 의 경우 `while` 과 기본 동작은 큰 차이 없지만, 조건을 검사하고 코드블럭을 실행하는 게 아니라 코드블럭을 실행한 후 조건을 검사합니다.    
이 사소한 차이로 `do-while` 은 처음부터 조건이 거짓이어도 코드블럭이 한 번은 실행됩니다.

```dart
do {
    // 여기에 작성된 코드 실행
    // 코드블럭의 끝에 도달하면 조건이 참인지 검사
    // 조건이 참이라면 코드블럭의 처음부터 다시 수행
    // 조건이 거짓이라면 코드블럭을 빠져 나옴
} while (조건);
```

실습
---

자, 그럼 이제부터 실습을 해야겠어요.    
~~라며 아뉴타 드립을 쳐봐도 아무도 인식 못하겠지...ㅋ~~

먼저 조건문에 대한 예제입니다.

지난 시간에 만든 본인 디렉토리에 `chapter02` 라는 이름의 하위 디렉토리를 생성하고, 그 안에 `ifExample.dart` 라는 이름의 파일을 생성합니다.    
그리고 다음과 같이 작성합니다.

```dart
main() {
  int number = 78; // 임의의 숫자로 변경

  if (number % 2 == 0) {
    print('$number은(는) 짝수입니다.');
  } else {
    print('$number은(는) 홀수입니다.');
  }
}
```

소스 코드 위에 `Run | Debug` 라는 버튼이 생성되었을텐데, `Run` 을 눌러 실행합니다.    

```
78은(는) 짝수입니다.
```

숫자를 바꿔가며 실행해봅니다.

이번에는 `switchExample.dart` 파일을 생성하고 다음과 같이 작성합니다.

```dart
main() {
  String command = 'STOP'; // 임의의 문자열로 변경

  switch (command) {
    case 'STOP':
      print('Stoped');
      break;
    case 'LEFT':
      print('Go Left');
      break;
    case 'RIGHT':
      print('Go Right');
      break;
    case 'FORWARD':
      print('Go Forward');
      break;
    case 'BACK':
      print('Go Back');
      break;
    default:
      print('Unknown Command');
  }
  print('Done');
}
```

문자열을 바꿔가며 실행해봅니다.

```
Stoped
```

```
Forward
```

```
Unknown Command
```

다음으로는 `assertExample.dart` 파일을 생성하고 다음과 같이 작성합니다.    

```dart
main() {
  String text;
  //text = 'KCA';

  try {
    assert(text != null);
    print('문자열은 "$text"입니다.');
  } catch (e) {
    print('문자열이 비었습니다.');
  }
}
```

코드를 실행해보고, 주석을 제거한 후 다시 실행해봅니다.

```
문자열이 비었습니다.
```

```
문자열은 "KCA"입니다.
```

반복문에 대한 예제도 살펴 봅시다.    
`forExample.dart` 파일을 생성해 다음과 같이 작성합니다.

```dart
main() {
  print('반복문은 역시 구구단이지!');

  for (int i = 2; i < 10; i++) {
    for (int j = 1; j < 10; j++) {
      print('$i x $j = ${i * j}');
    }
  }
}
```

```
반복문은 역시 구구단이지!
2 x 1 = 2
2 x 2 = 4
2 x 3 = 6
...(생략)...
9 x 7 = 63
9 x 8 = 72
9 x 9 = 81
```

`whileExample.dart` 파일을 생성하고 다음과 같이 작성합니다.

```dart
main() {
  print('각 자리수의 덧셈');

  int number = 1982;
  int sum = 0;

  while (number > 0) {
    sum += (number % 10);
    number ~/= 10; // 몫을 소수로 만들지 않고 나머지를 버리는 정수 나눗셈
  }

  print('합: $sum');
}
```

```
각 자리수의 덧셈
합: 20
```

<!-- TODO -->

과제
---

실습을 잘 수행했다면 과제는 아주 간단합니다.    
실습에서 이미 `chapter02` 디렉토리를 만들어 실습 코드를 작성하였죠?    
그것을 실행한 결과에 대한 스크린샷을 이 디렉토리에 추가하시면 됩니다.    
이 때, 조건문은 서로 다른 경우의 수 두 가지 이상을 스크린샷하도록 합니다. (소스 코드는 최종본 하나만 남겨 놓는 것으로 충분합니다.)    

과제를 성공적으로 완료하였다고 판단되면 merge 해드리며, 그렇지 않을 경우 comment로 피드백 드리겠습니다.    

Dart가 아닌 다른 프로그래밍 언어를 공부해보신 적 있는 분이라면 수월하게 넘어갔을 것이며, 그렇지 않은 부분이라면 헷갈리는 개념이 많을 수 있습니다.    
코딩 노베이스라면 잘 이해되지 않는 부분이 많은 것이 당연하므로... 언제라도 얼마든지 편하게 질문 남겨주시기 바랍니다ㅎ
