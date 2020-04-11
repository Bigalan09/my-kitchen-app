import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemeService with ChangeNotifier {
  Brightness _brightness;

  ThemeService(this._brightness);

  getBrightness() => _brightness;

  setBrightness(Brightness brightness) async {
    _brightness = brightness;
    notifyListeners();
  }
}
