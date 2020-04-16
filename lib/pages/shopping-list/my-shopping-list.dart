import 'package:flutter/material.dart';
import 'package:my_kitchen/pages/shopping-list/list-item.dart';
import 'package:my_kitchen/pages/shopping-list/shopping-list-dialog.dart';
import 'package:my_kitchen/services/theme/theme.dart';
import 'package:my_kitchen/theme/themed-page.dart';
import 'package:provider/provider.dart';

class MyShoppingList extends StatefulWidget {
  static String tag = '/my-shopping-list';

  MyShoppingList();

  @override
  _MyShoppingListState createState() => _MyShoppingListState();
}

class _MyShoppingListState extends State<MyShoppingList> {
  bool checked = false;

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;
    print(args);
    return ThemedPage(
      brightness: Provider.of<ThemeService>(context).getBrightness(),
      scaffoldBuilder: (Widget body) => Scaffold(
        extendBodyBehindAppBar: true,
        body: body,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0x0ff467F71),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) => ShoppingListDialog(
                  title: 'Success',
                  description:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  buttonText: 'Okay'),
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            title: Text(
                '${args.containsKey('title') ? '${args['title']} - ' : ''}Shopping list'),
            backgroundColor: Color(0xffE52739),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              ShoppingListItem(
                title: 'Sugar',
                quantity: '50g',
              ),
              ShoppingListItem(
                title: 'Tomato',
                quantity: '250g',
              ),
              ShoppingListItem(
                title: 'Milk',
                quantity: '1000ml',
              ),
              ShoppingListItem(
                title: 'Bread',
                quantity: '1 loaf',
              ),
              ShoppingListItem(
                title: 'Milk Chocolate',
                quantity: '50g',
              ),
              ShoppingListItem(
                title: 'Lemon',
                quantity: '35g',
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
