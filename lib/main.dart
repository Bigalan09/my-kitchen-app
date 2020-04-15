import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:my_kitchen/services/auth/auth.dart';
import 'package:my_kitchen/services/theme/theme.dart';
import 'package:my_kitchen/theme/themed-app.dart';
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
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor:
          SystemUiOverlayStyle.dark.systemNavigationBarColor,
    ),
  );
  // SystemChrome.setEnabledSystemUIOverlays([]);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemedApp(
      title: 'My Recipes',
    );
  }
}
