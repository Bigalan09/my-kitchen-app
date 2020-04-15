import 'package:flutter/material.dart';
import 'package:my_kitchen/theme/theme-manager.dart';

class ThemedApp extends StatelessWidget {
  final String title;

  final Map<String, WidgetBuilder> routes;
  ThemedApp({@required this.title, @required this.routes});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeManager.brightness(Brightness.light).materialTheme,
      darkTheme: ThemeManager.brightness(Brightness.dark).materialTheme,
      initialRoute: '/',
      routes: routes,
    );
  }
}
