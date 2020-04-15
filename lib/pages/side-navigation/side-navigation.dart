import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_kitchen/pages/login/login.dart';
import 'package:my_kitchen/services/auth/auth.dart';
import 'package:provider/provider.dart';

class SideNavigation extends StatefulWidget {
  @override
  _SideNavigationState createState() => _SideNavigationState();
}

class _SideNavigationState extends State<SideNavigation> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseUser>(
      future: Provider.of<AuthService>(context).getUser(),
      builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
        List<Widget> children = <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  bottom: 12.0,
                  left: 16.0,
                  child: Text(
                    "My Kitchen",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          )
        ];
        if (snapshot.hasData) {
          children.addAll([
            ListTile(
              title: Text('Pantry'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Meal Planner'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Shopping Lists'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Cook Books'),
              onTap: () {},
            ),
            ListTile(
              title: Text('Sign out'),
              onTap: () async {
                Navigator.of(context).pop();
                await Provider.of<AuthService>(context, listen: false).logout();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  LoginPage.tag,
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ]);
        } else {
          children.add(ListTile(
            title: Text('Sign in / Register'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(LoginPage.tag);
            },
          ));
        }
        return Drawer(
          child: ListView(
            children: children,
          ),
        );
      },
    );
  }
}
