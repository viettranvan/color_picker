<!--

-->
# eye_dropper

Pick colors from your application anywhere easily and 

[Web Example](https://viettranvan.github.io/eye_dropper/#/)

## Features

+ Pick color from your application screen

## How to use it

Add the dependency: 

```bash
$ flutter pub add eye_dropper
```

Import the package:

```dart
import 'package:eye_dropper/eye_dropper.dart';
```

Wrap `MaterialApp.builder` or `WidgetsApp.builder` with `EyeDropper`:

```dart
MaterialApp(
    home: const MyHomePage(title: 'Flutter Color Picker Demo'),
    builder: (context, child) => EyeDropper(child: child!),
),
```

Anywhere you want to use, call ` EyeDropper.enableEyeDropper()` method:

```dart
EyeDropper.enableEyeDropper(context, (color) {
  // handle the action you want after getting the color
});
```

## Screenshots
* Android and Ios

<p align="middle">
  <img src="https://user-images.githubusercontent.com/63132038/223469655-52dfb309-42ca-44f8-b9eb-d30bee38de8a.gif" width="48%">
  <img src="https://user-images.githubusercontent.com/63132038/223469674-2e1711c9-2d2a-4709-a066-6ed0471bebb1.gif" width="48%">
</p>

* Web
![web](https://user-images.githubusercontent.com/63132038/223469864-7d0bcd74-bccd-4f95-9a9c-661985286135.gif)

For testing in web, click [here](https://viettranvan.github.io/eye_dropper/#/)
