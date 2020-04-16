import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_kitchen/pages/dashboard/dashboard.dart';
import 'package:my_kitchen/pages/login/login.dart';
import 'package:my_kitchen/pages/recipe/recipe-page.dart';
import 'package:my_kitchen/pages/shopping-list/my-shopping-list.dart';
import 'package:my_kitchen/pages/shopping-list/shopping-lists.dart';
import 'package:my_kitchen/splashscreen.dart';
import 'package:provider/provider.dart';
import 'package:my_kitchen/services/auth/auth.dart';
import 'package:my_kitchen/services/theme/theme.dart';
import 'package:my_kitchen/theme/themed-app.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.getInstance().then((prefs) {
    var darkModeOn = prefs.getBool('darkMode') ?? false;
    SystemChrome.setPreferredOrientations(
            [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
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
        ShoppingListsPage.tag: (context) => ShoppingListsPage(),
        MyShoppingList.tag: (context) => MyShoppingList(),
        Dashboard.tag: (context) => Dashboard(),
        RecipePage.tag: (context) => RecipePage(),
        LoginPage.tag: (context) => LoginPage(),
      },
    );
  }
}
