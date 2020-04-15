import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_kitchen/theme/theme-manager.dart';
import 'package:my_kitchen/utils/back-override.dart';
import 'package:my_kitchen/utils/overlay-style.dart';

class ThemedPage extends StatelessWidget {
  const ThemedPage({
    Key key,
    this.brightness,
    this.navbarColor,
    this.scaffoldBuilder,
    @required this.body
  }): super(key: key);

  final Brightness brightness;
  final Color navbarColor;
  final Function(Widget child) scaffoldBuilder;
  final Widget body;

  @override
  Widget build(BuildContext context) => _ThemeWrapperWidget(
    brightness: brightness,
    child: _SystemUiStyleWrapper(
      navbarColor: navbarColor,
      child: scaffoldBuilder(
        BackOverrideWidget(
          child: body
        )
      )
    )
  );
}

class _ThemeWrapperWidget extends StatelessWidget {
  /// Enforces a light/dark theme on child widgets regardless of the system theme.
  const _ThemeWrapperWidget({
    Key key,
    this.brightness,
    this.child
  }): super(key: key);

  final Brightness brightness;
  final Widget child;

  @override
  Widget build(BuildContext context) => brightness == null ? child : Theme(
    data: ThemeManager.brightness(brightness).materialTheme,
    child: child
  );
}

class _SystemUiStyleWrapper extends StatelessWidget {
  /// Applies style to the statusbar (iOS + Android) and navbar (Android).
  const _SystemUiStyleWrapper({
    Key key,
    this.navbarColor,
    this.child
  }): super(key: key);

  final Color navbarColor;
  final Widget child;

  @override
  Widget build(BuildContext context) => AnnotatedRegion<SystemUiOverlayStyle>(
    value: OverlayStyle.getStyle(context, navbarColor: navbarColor),
    child: child
  );
}