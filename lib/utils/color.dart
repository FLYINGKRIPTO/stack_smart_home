import 'dart:ui';

extension ColorExt on String {
  Color fromHexToColor() {
    var hexColor = toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    if (hexColor.length == 8) {
      return Color(int.parse("0x$hexColor"));
    }
    return Color(int.parse("0x$hexColor"));
  }
}

class BrandColor {
  static const Color primaryColor = Color(0xff10101e);
  static const Color grey = Color(0xff87878e);
  static const Color white = Color(0xfff5f5f6);
  static const Color accent = Color(0xffff9b75);
}
