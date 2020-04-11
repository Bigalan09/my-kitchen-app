import 'package:flutter/material.dart';
import 'package:recipe/theme/palette.dart';

class CustomTheme {
  CustomTheme(Brightness brightness, this.palette) {
    materialTheme = ThemeData(
      brightness: brightness,
      primaryColor: palette.primary,
      accentColor: palette.primary,
      scaffoldBackgroundColor: palette.background,
      canvasColor: palette.foreground,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        actionTextColor: palette.primary,
        backgroundColor: palette.darkForeground,
        contentTextStyle: TextStyle(color: palette.darkForegroundText),
      ),
      highlightColor: palette.highlight,
      splashColor: palette.highlight,
      fontFamily: 'SourceSansPro',
    );
  }

  ThemeData materialTheme;
  Palette palette;
}
