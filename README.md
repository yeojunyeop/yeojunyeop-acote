# yeojunyeop_acote

여준엽 아코테 컨설팅 과제테스트 프로젝트

## Prerequisites

- Flutter 3.24.3 ver
- Dart 3.5.3 ver

## Setup

1. Android Studio 또는 Visual studio code 설치

- android studio : https://developer.android.com/studio/install?hl=ko
- visual studio code : https://code.visualstudio.com/download

2. flutter 설치

- [Flutter 공식 설치 가이드](https://flutter.dev/docs/get-started/install)에 따라 환경에 맞게 개발환경을 구성합니다.

3. flutter plugin 설치

- android studio : Preference - flutter, dart 설치
- visual studio code : 보기(view) - 확장(Extensions) - flutter, dart 설치

4. yeojunyeop_acote github에서 프로젝트를 복제해 local에 세팅합니다.
   [git clone 참조](https://docs.github.com/ko/repositories/creating-and-managing-repositories/cloning-a-repository)
5. 종속성 설치

```sh
$ flutter pub get
```

6. 앱 실행

```sh
$ flutter run
```

## Structure

- MVVM 패턴을 사용하여 각 구성요소의 책임을 명확하게 나누고 프로젝트의 전반적인 설계를 간결하고 효율적일 수 있도록 했습니다.
- 모델에서는 데이터 구조를 정의하고 뷰에서는 데이터를 표시하고 사용자 입력을 처리하며 뷰모델에서는 데이터 변환 및 상태관리를 하여 뷰와 모델의 독립성을 유지합니다.
- API 통신을 provider/functions.dart로 분리하여 관리함으로써 코드의 재사용성과 유지보수성을 향상시켰습니다.


## State Management

- 상태관리는 간편하고 네비게이션 기능 등 다양한 기능을 가지고있고 효율적인 메모리 관리도 할 수 있는 GetX로 하였습니다.
- GetBuilder + update() 기능을 통해 간단하게 화면을 업데이트하고 효율적으로 상태관리를 구현할 수 있었습니다.
- Get.to() 기능을 사용해 네비게이션을 처리하고 GetxController를 바인딩하여 필요한 시점에만 메모리를 사용하도록 했습니다.
- 
