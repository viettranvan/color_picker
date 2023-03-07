part of eye_dropper;

const double kEyeDropperSize = 16;
const Size kOverlaySize = Size(64, 88);

Color getPixelFromByteData(
  ByteData byteData, {
  required int width,
  required int x,
  required int y,
}) {
  try {
    final index = (y * width + x) * 4;
    final r = byteData.getUint8(index);
    final g = byteData.getUint8(index + 1);
    final b = byteData.getUint8(index + 2);
    final a = byteData.getUint8(index + 3);

    return Color.fromARGB(a, r, g, b);
  } catch (e) {
    return Colors.transparent;
  }
}

/// Returns the [color] in hexadecimal (#RRGGBB) format.
///
/// If [withAlpha] is [true], then returns it in #AARRGGBB format.
String colorToHexString(Color color, {bool withAlpha = false}) {
  final a = color.alpha.toRadixString(16).padLeft(2, '0');
  final r = color.red.toRadixString(16).padLeft(2, '0');
  final g = color.green.toRadixString(16).padLeft(2, '0');
  final b = color.blue.toRadixString(16).padLeft(2, '0');

  if (withAlpha) {
    return '$a$r$g$b';
  }

  return '#$r$g$b';
}

Color getTextColorOnBackground(Color background) {
  final luminance = background.computeLuminance();

  if (luminance > 0.5) return Colors.black;
  return Colors.white;
}
