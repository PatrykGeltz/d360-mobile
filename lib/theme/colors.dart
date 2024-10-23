import 'package:flutter/material.dart';

Color hsla(double hue, double saturation, double lightness, double alpha) {
  return HSLColor.fromAHSL(alpha, hue, saturation, lightness).toColor();
}

Color hsl(double hue, double saturation, double lightness) {
  return HSLColor.fromAHSL(1.0, hue, saturation, lightness).toColor();
}

Map<String, Color> kThemeColorsLight = {
  'primary': const HSLColor.fromAHSL(1.0, 195.0, 0.75, 0.75).toColor(),
  'secondary': const HSLColor.fromAHSL(1.0, 195.0, 0.75, 0.85).toColor(),
  'special': const HSLColor.fromAHSL(1.0, 220.0, 0.5, 0.8).toColor(),
  'textPrimary': const HSLColor.fromAHSL(1.0, 195.0, 0.75, 0.1).toColor(),
  'textSecondary': const HSLColor.fromAHSL(1.0, 195.0, 0.25, 0.5).toColor(),
  'background': const HSLColor.fromAHSL(1.0, 195.0, 0.75, 0.9).toColor(),
  'danger': const HSLColor.fromAHSL(1.0, 0, 1, .55).toColor(),
  'textDanger': const HSLColor.fromAHSL(1.0, 0, 1, .45).toColor(),
};

Map<String, Color> kThemeColorsDark = {
  'primary': const HSLColor.fromAHSL(1.0, 195.0, 1.0, 0.25).toColor(),
  'secondary': const HSLColor.fromAHSL(1.0, 195.0, 0.75, 0.2).toColor(),
  'special': const HSLColor.fromAHSL(1.0, 30.0, 0.25, 0.75).toColor(),
  'textPrimary': const HSLColor.fromAHSL(1.0, 195.0, 1.0, 0.9).toColor(),
  'textSecondary': const HSLColor.fromAHSL(1.0, 195.0, 0.25, 0.5).toColor(),
  'background': const HSLColor.fromAHSL(1.0, 195.0, 0.75, 0.15).toColor(),
  'danger': const HSLColor.fromAHSL(1.0, 0, 1, .45).toColor(),
  'textDanger': const HSLColor.fromAHSL(1.0, 0, 1, .55).toColor(),
};

// const Map<String, Color> kThemeColorsLight = {
//   'primary': Color(0xFF5788A2),
//   'secondary': Color(0xFFACC3D3),
//   'special': Color(0xFFFCE5b6),
//   'textPrimary': Color(0xFF090909),
//   'textSecondary': Color(0xFF4B5043),
//   'background': Color(0xFFA1BEC9)
// };
//
// const Map<String, Color> kThemeColorsDark = {
//   'primary': Color(0xff45708a),
//   'secondary': Color(0xFF516170),
//   'special': Color(0xFFEAD8B1),
//   'textPrimary': Color(0xFFDFDFDF),
//   'textSecondary': Color(0xFFAAAAAA),
//   'background': Color(0xFF001F3F)
// };

class ThemeColors {
  static get dark => kThemeColorsDark;
  static get light => kThemeColorsLight;

  static of(BuildContext context) {
    final isLightTheme = Theme.of(context).brightness == Brightness.light;

    return isLightTheme ? kThemeColorsLight : kThemeColorsDark;
  }
}

// const kPrimaryLIGHT = Color(0xff8DDBE0);
// const kSecondaryLIGHT = Color(0xffD3FFE9);
// const kTextPrimaryLIGHT = Color(0xff090909);
// const kTextSecondaryLIGHT = Color(0xff4B5043);
// const kBackgroundLIGHT = Color(0xff9BC4BC);


// const kPrimaryDARK = Color(0xff222047);
// const kSecondaryDARK = Color(0xff16396D);
// const kTextPrimaryDARK = Color(0xffDFDFDF);
// const kTextSecondaryDARK = Color(0xffAAAAAA);
// const kBackgroundDARK = Color(0xff282C3A);
