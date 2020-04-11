import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipe/pages/login/login.dart';
import 'package:recipe/pages/recipe/recipe-page.dart';
import 'package:recipe/services/theme/theme.dart';
import 'package:recipe/theme/themed-page.dart';

class Dashboard extends StatelessWidget {
  static String tag = '/';

  @override
  Widget build(BuildContext context) => ThemedPage(
        brightness: Provider.of<ThemeService>(context).getBrightness(),
        scaffoldBuilder: (Widget body) => Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0.0,
            title: Text(
              'My Recipes',
            ),
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text('Sign in'),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushNamed(LoginPage.tag);
                  },
                )
              ],
            ),
          ),
          body: body,
        ),
        body: SafeArea(
          child: Center(
            child: RaisedButton(
              elevation: 1.0,
              child: Text(
                'Recipe',
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RecipePage(),
                  ),
                );
              },
            ),
          ),
        ),
      );
}
