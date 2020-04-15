import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_kitchen/pages/dashboard/dashboard.dart';
import 'package:my_kitchen/pages/login/login.dart';
import 'package:my_kitchen/services/auth/auth.dart';
import 'package:my_kitchen/splashscreen.dart';
import 'package:my_kitchen/theme/theme-manager.dart';
import 'package:provider/provider.dart';

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
        '/': (context) => SplashScreen(
              nextPage: FutureBuilder<FirebaseUser>(
                future: Provider.of<AuthService>(context).getUser(),
                builder: (context, AsyncSnapshot<FirebaseUser> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.error != null) {
                      print("error");
                      return Text(snapshot.error.toString());
                    }
                    return snapshot.hasData ? Dashboard() : LoginPage();
                  }
                  return Center(
                    child: Container(
                      child: CircularProgressIndicator(),
                      alignment: Alignment(0.0, 0.0),
                    ),
                  );
                },
              ),
            ),
        '/dashboard': (context) => Dashboard(),
        '/login': (context) => LoginPage(),
      },
    );
  }
}
