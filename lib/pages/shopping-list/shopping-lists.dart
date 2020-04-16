import 'package:flutter/material.dart';
import 'package:my_kitchen/pages/shopping-list/my-shopping-list.dart';
import 'package:my_kitchen/services/theme/theme.dart';
import 'package:my_kitchen/theme/themed-page.dart';
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
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              title: Text('Shopping Lists'),
              backgroundColor: Color(0xffE52739),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                ListTile(
                  title: Text('Week 1'),
                  subtitle: Text('My awesome shopping list'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  onTap: () {
                    Navigator.of(context).pushNamed(MyShoppingList.tag,
                        arguments: {'title': 'Week 1'});
                  },
                ),
              ]),
            ),
          ],
        ),
      );
}
