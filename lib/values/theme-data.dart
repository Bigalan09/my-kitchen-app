import 'package:flutter/material.dart';
import 'package:recipe/theme/custom-theme.dart';
import 'package:recipe/theme/palette.dart';

final CustomTheme themeLight = CustomTheme(
  Brightness.light,
  const Palette(
    primary: Color(0xffffbb22),
    secondary: Color(0xffFFC43B),
    background: Color(0xfff3f5f9),
    foreground: Color(0xffffffff),
    textPrimary: Color(0xff242326),
    textSecondary: Color(0xff8793a0),
    shadow: Color.fromRGBO(100, 116, 152, 0.2),
    overlay: Color(0xffffffff),
    danger: Color(0xffe30000),
    darkForeground: Color(0xff222f3b),
    darkForegroundText: Color(0xffffffff),
    highlight: Color.fromRGBO(100, 116, 152, 0.1),
  ),
);

final CustomTheme themeDark = CustomTheme(
  Brightness.dark,
  const Palette(
    primary: Color(0xffc62828),
    secondary: Color(0xffff4081),
    background: Color(0xff0c1b28),
    foreground: Color(0xff222f3b),
    textPrimary: Color(0xffffffff),
    textSecondary: Color(0xff8793a0),
    shadow: Color(0xff07090d),
    overlay: Color(0xff000000),
    danger: Color(0xffe30000),
    darkForeground: Color(0xff222f3b),
    darkForegroundText: Color(0xffffffff),
    highlight: Color.fromRGBO(255, 255, 255, 0.1),
  ),
);
