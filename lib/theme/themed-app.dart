import 'package:flutter/material.dart';
import 'package:my_kitchen/pages/dashboard/dashboard.dart';
import 'package:my_kitchen/pages/login/login.dart';
import 'package:my_kitchen/theme/theme-manager.dart';

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
        '/': (context) => LoginPage(),
        '/dashboard': (context) => Dashboard(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
