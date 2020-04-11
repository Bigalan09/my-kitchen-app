import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:recipe/pages/dashboard/dashboard.dart';
import 'package:recipe/services/auth/auth.dart';
import 'package:recipe/services/theme/theme.dart';
import 'package:recipe/theme/themed-app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs) {
    var darkModeOn = prefs.getBool('darkMode') ?? false;
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
        .then((_) {
      runApp(
        MultiProvider(
          child: MyApp(),
          providers: [
            ChangeNotifierProvider<AuthService>(
              create: (BuildContext context) {
                return AuthService();
              },
            ),
            ChangeNotifierProvider<ThemeService>(
              create: (BuildContext context) {
                return ThemeService(
                    darkModeOn ? Brightness.dark : Brightness.light);
              },
            ),
          ],
        ),
      );
    });
  });
  // SystemChrome.setEnabledSystemUIOverlays([]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemedApp(
      title: 'My Recipes',
      body: Dashboard(),
    );
  }
}
