<!--

-->
# color_picker

Pick colors from your application anywhere easily and 

[Web Example](https://viettranvan.github.io/color_picker/#/)

## Features

+ Pick color from your application screen

## How to use it

Add the dependency: 

```bash
$ flutter pub add color_picker
```

Import the package:

```dart
import 'package:color_picker/color_picker.dart';
```

Wrap `MaterialApp.builder` or `WidgetsApp.builder` with `ColorPicker`:

```dart
MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
        primarySwatch: Colors.blue,
    ),
    home: const MyHomePage(title: 'Flutter Demo Home Page'),
    builder: (context, child) => ColorPicker(child: child!),
),
```

Anywhere you want to use, call `ColorPicker.enableColorPicker()` method:

```dart
ColorPicker.enableColorPicker(context, (color) {
  // handle the action you want after getting the color
});
```

## Screenshots
* Android and Ios
![android](https://user-images.githubusercontent.com/63132038/223469655-52dfb309-42ca-44f8-b9eb-d30bee38de8a.gif)
![ios](https://user-images.githubusercontent.com/63132038/223469674-2e1711c9-2d2a-4709-a066-6ed0471bebb1.gif)
* Web
![web](https://user-images.githubusercontent.com/63132038/223469864-7d0bcd74-bccd-4f95-9a9c-661985286135.gif)

For testng in web, click [here](https://viettranvan.github.io/color_picker/#/)
