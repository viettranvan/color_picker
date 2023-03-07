<!--

-->
# color_picker

Pick colors from your application anywhere easily and conveniently

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