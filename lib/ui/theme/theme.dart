import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:provider/provider.dart";

import "../../data/state/theme_color_provider.dart";
import "../../data/state/font_provider.dart";

/// List of colors that the user can select as a theme color.
List<Color> themeColors = [
  Colors.amber,
  Colors.blue,
  Colors.blueGrey,
  Colors.brown,
  Colors.cyan,
  Colors.deepOrange,
  Colors.deepPurple,
  Colors.green,
  Colors.grey,
  Colors.indigo,
  Colors.lightBlue,
  Colors.lightGreen,
  Colors.lime,
  Colors.orange,
  Colors.pink,
  Colors.purple,
  Colors.red,
  Colors.teal,
  Colors.yellow,
];

ThemeData lightTheme(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: context.watch<ThemeColorProvider>().themeColor,
    ),
    fontFamily: context.watch<FontProvider>().font == "Standard"
        ? null
        : context.watch<FontProvider>().font,
  );
}

ThemeData darkTheme(BuildContext context) {
  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: context.watch<ThemeColorProvider>().themeColor,
      brightness: Brightness.dark,
    ),
    fontFamily: context.watch<FontProvider>().font == "Standard"
        ? null
        : context.watch<FontProvider>().font,
  );
}

/// ButtonStyle that creates TextButtons with foreground + icon in given color.
ButtonStyle coloredTextButtonStyle(Color color) {
  return ButtonStyle(
    foregroundColor: WidgetStatePropertyAll(color),
    iconColor: WidgetStatePropertyAll(color),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
  );
}

/// Helper method to determine visible ripple color from given Color background.
Color getRippleColorFromBackground(Color background) {
  return ThemeData.estimateBrightnessForColor(background) == Brightness.dark
      ? Colors.white.withValues(alpha: 0.2)
      : Colors.black.withValues(alpha: 0.2);
}

/// Makes system navigation transparent. Apply to app bar.
const transparentSystemUiOverlayStyle = SystemUiOverlayStyle(
  statusBarColor: Colors.transparent,
  systemNavigationBarColor: Colors.transparent,
  systemStatusBarContrastEnforced: false,
  systemNavigationBarContrastEnforced: false,
);
