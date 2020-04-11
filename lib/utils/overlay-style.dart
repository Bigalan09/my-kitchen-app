import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipe/theme/theme-manager.dart';

class OverlayStyle {
  /// Gets the UI style for for the given brightness or theme brightness.
  static SystemUiOverlayStyle getStyle(BuildContext context,
      {Brightness brightness, Color navbarColor}) {
    // If no brightness parameter was passed, use the theme brightness
    brightness ??= Theme.of(context).brightness == Brightness.light
        ? Brightness.dark
        : Brightness.light;
    // Apply the style
    return SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: brightness,
        statusBarBrightness: brightness,
        systemNavigationBarIconBrightness: brightness,
        systemNavigationBarColor:
            navbarColor ?? ThemeManager.of(context).palette.background);
  }
}
