routing with animation for AngularDart
======================================


## Description

AngularDartでのページ遷移アニメーションを支援するしょぼいライブラリです。<br>
既にルータを使用したAngularDart(5+)製アプリケーションがある前提です。

## Installation

```bash
$ git clone https://github.com/takutaro/router_animation.git
$ cd router_animation/
$ pub get
```

## Demo

下記にてサーバ起動後、ブラウザで http://localhost:8080/ を開きます。

```bash
$ pub run build_runner serve example/
```

## Usage

（基本的には、exampleのコードを参照願います。以下にポイントを示します）<br>

現在のページや遷移先のページに適用する、アニメーション用cssを用意しておきます。
```
例) example/pages/route_animation.css
```

ページ(コンポーネント)で```router_animation```パッケージをimportし、```styleUrls``` に前述のcssを指定します。<br>
また、```RouterAnimationOperator```クラスをmix-inします。

```dart
import 'package:angular/angular.dart';
import "package:router_animation/router_animation.dart";

@Component(
  selector: 'p001',
  templateUrl: 'page.html',
  styleUrls: ['../router_animation.css'],
)
class P001Component extends Object with RouterAnimationOperator {}

```

ページ遷移する際、現在のページ(```current```)と遷移先のページ(```next```)に、前述のcssファイルに記述したクラス名を指定します。<br>
（ブラウザのアドレスバーに下記パラメータが表示されてしまうので、指定方法は見直すかもしれませんが、元々フルスクリーンを想定して作っているので多分見直さないと思います）

```dart
    var nvp = NavigationParams(queryParameters: {'current': 'backout', 'next': 'backin'});
    router.navigate(backpage[router.current.path], nvp);
```

## Author

takutaro.

## License

The MIT License (MIT).