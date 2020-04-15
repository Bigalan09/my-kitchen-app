import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_kitchen/pages/side-navigation/side-navigation.dart';
import 'package:my_kitchen/services/theme/theme.dart';
import 'package:my_kitchen/theme/themed-page.dart';
import 'package:my_kitchen/pages/recipe/recipe-page.dart';

class Dashboard extends StatelessWidget {
  static String tag = '/dashboard';

  @override
  Widget build(BuildContext context) => ThemedPage(
        brightness: Provider.of<ThemeService>(context).getBrightness(),
        scaffoldBuilder: (Widget body) => Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0.0,
          ),
          drawer: SideNavigation(),
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
