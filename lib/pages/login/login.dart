import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:provider/provider.dart';
import 'package:my_kitchen/pages/dashboard/dashboard.dart';
import 'package:my_kitchen/services/auth/auth.dart';
import 'package:my_kitchen/services/theme/theme.dart';
import 'package:my_kitchen/theme/themed-page.dart';

class LoginPage extends StatefulWidget {
  static String tag = '/login';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<String> _authLogin(LoginData data) async {
    try {
      await Provider.of<AuthService>(context, listen: false)
          .loginUser(email: data.name, password: data.password);
    } on AuthException catch (e) {
      return e.message;
    } on Exception catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<String> _authRegister(LoginData data) async {
    try {
      await Provider.of<AuthService>(context, listen: false).createUser(
          displayName: data.name, email: data.name, password: data.password);
    } on AuthException catch (e) {
      return e.message;
    } on Exception catch (e) {
      return e.toString();
    }
    return null;
  }

  Future<String> _recoverPassword(String name) {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return ThemedPage(
        brightness: Provider.of<ThemeService>(context).getBrightness(),
        scaffoldBuilder: (Widget body) => Scaffold(
              extendBodyBehindAppBar: true,
              body: body,
            ),
        body: Stack(
          children: <Widget>[
            FlutterLogin(
              title: 'My Kitchen',
              logo: 'assets/images/logo.png',
              logoTag: 'logo',
              onLogin: _authLogin,
              onSignup: _authRegister,
              onSubmitAnimationCompleted: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Dashboard.tag,
                  (Route<dynamic> route) => false,
                );
              },
              onRecoverPassword: _recoverPassword,
            ),
            Positioned(
              width: MediaQuery.of(context).size.width / 2,
              bottom: 48.0,
              left: MediaQuery.of(context).size.width / 4,
              child: new OutlineButton(
                textColor: Colors.white,
                child: Text(
                  'Continue as Guest',
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Dashboard.tag,
                    (Route<dynamic> route) => false,
                  );
                },
                borderSide: BorderSide(
                  color: Colors.white,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    30.0,
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
