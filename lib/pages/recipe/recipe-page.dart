import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_kitchen/services/theme/theme.dart';
import 'package:my_kitchen/theme/themed-page.dart';

class RecipePage extends StatelessWidget {
  static String tag = '/recipe';

  final Map recipe = {
    'title': 'Vegan Curry',
    'short-description': 'A lovely vegan curry',
    'cook-times': {
      'prep': 20,
      'cook': 35,
    },
    'ingredients': [
      {'name': 'Sugar', 'quantity': '1', 'measurement': 'tsp'},
      {'name': 'Plain flour', 'quantity': '150', 'measurement': 'g'},
      {'name': 'salt', 'quantity': '1/4', 'measurement': 'tsp'},
    ],
    'steps': [
      'Pre-heat the oven',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vehicula tellus vel eleifend lacinia. Nunc vestibulum eu elit ac fringilla. Praesent ut ornare purus, nec porta nunc. Donec malesuada lacinia orci, non fringilla elit cursus sed. Maecenas sit amet tincidunt elit. Integer commodo est at lacus facilisis aliquam. Etiam in enim at massa imperdiet eleifend ac eu quam.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vehicula tellus vel eleifend lacinia. Nunc vestibulum eu elit ac fringilla. Praesent ut ornare purus, nec porta nunc. Donec malesuada lacinia orci, non fringilla elit cursus sed. Maecenas sit amet tincidunt elit. Integer commodo est at lacus facilisis aliquam. Etiam in enim at massa imperdiet eleifend ac eu quam.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vehicula tellus vel eleifend lacinia. Nunc vestibulum eu elit ac fringilla. Praesent ut ornare purus, nec porta nunc. Donec malesuada lacinia orci, non fringilla elit cursus sed. Maecenas sit amet tincidunt elit. Integer commodo est at lacus facilisis aliquam. Etiam in enim at massa imperdiet eleifend ac eu quam.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vehicula tellus vel eleifend lacinia. Nunc vestibulum eu elit ac fringilla. Praesent ut ornare purus, nec porta nunc. Donec malesuada lacinia orci, non fringilla elit cursus sed. Maecenas sit amet tincidunt elit. Integer commodo est at lacus facilisis aliquam. Etiam in enim at massa imperdiet eleifend ac eu quam.',
    ]
  };

  @override
  Widget build(BuildContext context) {
    final descTextStyle = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w800,
      letterSpacing: 0.5,
      fontSize: 13,
      height: 2,
    );

// DefaultTextStyle.merge() allows you to create a default text
// style that is inherited by its child and all subsequent children.
    final iconList = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Icon(Icons.kitchen, color: Colors.green[500]),
                Text('PREP:'),
                Text('25 min'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.timer, color: Colors.green[500]),
                Text('COOK:'),
                Text('1 hr'),
              ],
            ),
            Column(
              children: [
                Icon(Icons.restaurant, color: Colors.green[500]),
                Text('FEEDS:'),
                Text('4-6'),
              ],
            ),
          ],
        ),
      ),
    );
    return ThemedPage(
      brightness: Provider.of<ThemeService>(context).getBrightness(),
      scaffoldBuilder: (Widget body) => Scaffold(
        extendBodyBehindAppBar: true,
        body: body,
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            pinned: false,
            stretch: true,
            elevation: 0.0,
            actions: <Widget>[
              IconButton(
                icon: const Icon(
                  Icons.more_vert,
                ),
                tooltip: 'Add new entry',
                onPressed: () {/* ... */},
              ),
            ],
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: <StretchMode>[
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
                StretchMode.fadeTitle,
              ],
              title: Text(
                '${recipe['title'].toString()}',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/curry.jpg',
                    fit: BoxFit.cover,
                  ),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.5),
                        end: Alignment(0.0, 0.0),
                        colors: <Color>[
                          Color(0x60000000),
                          Color(0x00000000),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                margin: const EdgeInsets.all(
                  8.0,
                ),
                child: iconList,
              ),
              Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                margin: const EdgeInsets.all(
                  8.0,
                ),
                child: Column(
                  children: ingredients(recipe['ingredients']),
                ),
              ),
              Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                margin: const EdgeInsets.all(
                  8.0,
                ),
                child: Column(
                  children: method(recipe['steps']),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  List<Widget> method(List strings) {
    List<Widget> list = new List<Widget>();
    list.add(
      ListTile(
        title: new Text('Method'),
      ),
    );
    for (var i = 0; i < strings.length; i++) {
      list.add(
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('${(i + 1).toString()}.'),
              SizedBox(
                width: 12.0,
              ),
              Expanded(child: Text(strings[i]))
            ],
          ),
        ),
      );
      list.add(
        SizedBox(
          height: 12.0,
        ),
      );
    }
    return list;
  }

  List<Widget> ingredients(List strings) {
    List<Widget> list = new List<Widget>();
    list.add(
      ListTile(
        title: new Text('Ingredients'),
      ),
    );
    for (var i = 0; i < strings.length; i++) {
      list.add(
        Padding(
          padding: const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                  '${strings[i]['quantity'].toString()}${strings[i]['measurement'].toString()}'),
              SizedBox(
                width: 8.0,
              ),
              Text('-'),
              SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: Text('${strings[i]['name'].toString()}'),
              ),
            ],
          ),
        ),
      );
    }
    list.add(SizedBox(
      height: 10.0,
    ));
    return list;
  }
}
