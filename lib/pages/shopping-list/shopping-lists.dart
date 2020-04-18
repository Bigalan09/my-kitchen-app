import 'package:flutter/material.dart';
import 'package:my_kitchen/pages/shopping-list/my-shopping-list.dart';
import 'package:my_kitchen/services/theme/theme.dart';
import 'package:my_kitchen/theme/themed-page.dart';
import 'package:my_kitchen/widgets/dismissible-list.dart';
import 'package:provider/provider.dart';

class ShoppingListsPage extends StatefulWidget {
  static String tag = '/shopping-lists';

  @override
  _ShoppingListsPageState createState() => _ShoppingListsPageState();
}

class _ShoppingListsPageState extends State<ShoppingListsPage> {
  @override
  Widget build(BuildContext context) => ThemedPage(
      brightness: Provider.of<ThemeService>(context).getBrightness(),
      scaffoldBuilder: (Widget body) => Scaffold(
            extendBodyBehindAppBar: true,
            body: body,
          ),
      body: DismissibleList(
        title: 'My Shopping Lists',
        items: <Widget>[
          ListTile(
            title: Text('Week 1'),
            subtitle: Text('My awesome shopping list'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).pushNamed(MyShoppingList.tag,
                  arguments: {'title': 'Week 1'});
            },
          ),
          ListTile(
            title: Text('Week 2'),
            subtitle: Text('My awesome shopping list'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).pushNamed(MyShoppingList.tag,
                  arguments: {'title': 'Week 2'});
            },
          ),
          ListTile(
            title: Text('Week 3'),
            subtitle: Text('My awesome shopping list'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              Navigator.of(context).pushNamed(MyShoppingList.tag,
                  arguments: {'title': 'Week 3'});
            },
          ),
        ],
      ));
}
