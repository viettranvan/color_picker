part of color_picker;

class ColorPickerOverlay extends StatelessWidget {
  const ColorPickerOverlay({
    Key? key,
    required this.color,
    this.overlayColor,
  }) : super(key: key);

  final Color color;
  final Color? overlayColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kOverlaySize.height,
      width: kOverlaySize.width,
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                width: kColorPickerSize * 4,
                height: kColorPickerSize * 4,
                alignment: Alignment.bottomRight,
                child: Image.asset(
                  'assets/color-picker-overlay.png',
                  fit: BoxFit.fitHeight,
                  color: overlayColor,
                  width: kColorPickerSize * 4,
                  height: kColorPickerSize * 4,
                ),
              ),
              Positioned(
                top: 4,
                left: 6,
                right: 6,
                child: CircleAvatar(
                  backgroundColor: color,
                  radius: 22,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            height: kColorPickerSize,
            width: kColorPickerSize,
            decoration: BoxDecoration(
                color: color,
                border:
                    Border.all(width: 1.0, color: overlayColor ?? Colors.black45),
                borderRadius: BorderRadius.circular(16)),
          ),
        ],
      ),
    );
  }
}
