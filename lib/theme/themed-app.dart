import 'package:flutter/material.dart';
import 'package:recipe/pages/dashboard/dashboard.dart';
import 'package:recipe/pages/login/login.dart';
import 'package:recipe/theme/theme-manager.dart';

class ThemedApp extends StatelessWidget {
  final String title;
  ThemedApp({@required this.title});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeManager.brightness(Brightness.light).materialTheme,
      darkTheme: ThemeManager.brightness(Brightness.dark).materialTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => Dashboard(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
