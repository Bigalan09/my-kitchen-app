import 'package:flutter/material.dart';
import 'package:recipe/pages/login/login.dart';

class SideNavigation extends StatefulWidget {
  @override
  _SideNavigationState createState() => _SideNavigationState();
}

class _SideNavigationState extends State<SideNavigation> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).secondaryHeaderColor,
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: CircleAvatar(
                    radius: 35.0,
                    backgroundColor: Colors.lightBlueAccent,
                    child: Text(
                      'AG',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 12.0,
                  left: 16.0,
                  child: Text(
                    "My Kitchen",
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            title: Text('Pantry'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Meal Planner'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Shopping List'),
            onTap: () {},
          ),
          ListTile(
            title: Text('My Recipes'),
            onTap: () {},
          ),
          ListTile(
            title: Text('Sign in / Register'),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushNamed(LoginPage.tag);
            },
          ),
        ],
      ),
    );
  }
}
