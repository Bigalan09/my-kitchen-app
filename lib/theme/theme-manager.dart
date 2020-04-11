import 'package:flutter/material.dart';
import 'package:recipe/theme/custom-theme.dart';
import 'package:recipe/values/theme-data.dart';

/// Custom theme manager for universal light and dark colors
class ThemeManager {
  /// Get the custom theme based on the context theme brightness
  static CustomTheme of(BuildContext context) {
    return brightness(Theme.of(context).brightness);
  }

  /// Get the custom theme based on the given brightness
  static CustomTheme brightness(Brightness brightness) {
    return brightness == Brightness.light ? themeLight : themeDark;
  }
}