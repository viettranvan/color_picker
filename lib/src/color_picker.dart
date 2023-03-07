part of color_picker;

class ColorPicker extends StatefulWidget {
  const ColorPicker({
    super.key,
    required this.child,
    this.haveTextColorWidget = true,
  });

  final Widget child;
  final bool haveTextColorWidget;

  static void enableColorPicker(
      BuildContext context, Function(Color?)? onColorPicker) async {
    _ColorPickerState? state =
        context.findAncestorStateOfType<_ColorPickerState>();
    state?.enableColorPicker(onColorPicker);
  }

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  final GlobalKey _renderKey = GlobalKey();

  ui.Image? _image;
  bool _enableColorPicker = false;

  final _offsetNotifier = ValueNotifier<Offset>(const Offset(0, 0));
  final _colorNotifier = ValueNotifier<Color?>(null);
  final _byteDataStateNotifier = ValueNotifier<ByteData?>(null);
  Function(Color?)? _onColorPicker;

  void enableColorPicker(Function(Color?)? onColorPicker) async {
    var renderBox = _renderKey.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;

    final boundary =
        _renderKey.currentContext!.findRenderObject()! as RenderRepaintBoundary;

    // inital image - byte data
    _image = await boundary.toImage();
    _byteDataStateNotifier.value = await _image!.toByteData();

    setState(() {
      // enable color picker
      _enableColorPicker = true;
      // place the color picker overlay's position in the center
      updatePosition(Offset(size.width / 2, size.height / 2));

      _onColorPicker = onColorPicker;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Listener(
          behavior: HitTestBehavior.translucent,
          onPointerDown: onPointerDown,
          onPointerMove: onPointerMove,
          onPointerUp: onPointerUp,
          child: RepaintBoundary(
            key: _renderKey,
            child: widget.child,
          ),
        ),
        Visibility(
          visible: _enableColorPicker,
          child: Positioned(
            left: getOverlayPosition().dx,
            top: getOverlayPosition().dy,
            child: Listener(
              onPointerMove: onPointerMove,
              onPointerUp: onPointerUp,
              child: ColorPickerOverlay(
                  color: _colorNotifier.value ?? Colors.transparent,
                ),
            ),
          ),
        ),
        Visibility(
          visible: (_colorNotifier.value != null),
          child: Positioned(
            left: _offsetNotifier.value.dx - 30,
            top: _offsetNotifier.value.dy + 20,
            child: Material(
              shadowColor: Colors.black,
              elevation: 1.0,
              borderRadius: BorderRadius.circular(5),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(
                  _colorNotifier.value == null
                      ? ''
                      : colorToHexString(_colorNotifier.value!),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Offset getOverlayPosition() {
    double dx = _offsetNotifier.value.dx - kOverlaySize.width / 2;
    double dy =
        _offsetNotifier.value.dy - kOverlaySize.height + kColorPickerSize / 2;
    return Offset(dx, dy);
  }

  void onPointerDown(PointerDownEvent event) {
    if (_enableColorPicker) {
      updatePosition(event.position);
    }
  }

  void onPointerMove(PointerMoveEvent event) {
    if (_enableColorPicker) {
      updatePosition(event.position);
    }
  }

  void onPointerUp(PointerUpEvent event) async {
    if (_enableColorPicker) {
      if (_colorNotifier.value != null) {
        _onColorPicker?.call(_colorNotifier.value);
      }

      setState(() {
        _enableColorPicker = false;
        _offsetNotifier.value = const Offset(0, 0);
        _colorNotifier.value = null;
        _image = null;
      });
    }
  }

  updatePosition(Offset newPosition) async {
    var color = getPixelFromByteData(
      _byteDataStateNotifier.value!,
      width: _image!.width,
      x: newPosition.dx.toInt(),
      y: newPosition.dy.toInt(),
    );

    setState(() {
      // update position
      _offsetNotifier.value = newPosition;

      // update color
      _colorNotifier.value = color;
    });
  }
}
