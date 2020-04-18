import 'package:flutter/material.dart';
import 'package:my_kitchen/theme/custom-theme.dart';
import 'package:my_kitchen/theme/palette.dart';

final CustomTheme themeLight = CustomTheme(
  Brightness.light,
  const Palette(
    primary: Color(0xffffc439),
    secondary: Color(0xff2C3F59),
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
    primary: Color(0xffffc439),
    secondary: Color(0xff2C3F59),
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
