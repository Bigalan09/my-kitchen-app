import 'package:flutter/material.dart';

class RecipeViewPage extends StatelessWidget {
  final Map recipe = {
    'title': 'Curry',
    'short-description': 'A lovely vegan curry',
    'cook-times': {
      'prep': 20,
      'cook': 35,
    },
    'ingredients': [
      {'name': 'Sugar', 'quantity': '1', 'measurement': 'tsp'},
    ],
    'steps': [
      'Pre-heat the oven',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vehicula tellus vel eleifend lacinia. Nunc vestibulum eu elit ac fringilla. Praesent ut ornare purus, nec porta nunc. Donec malesuada lacinia orci, non fringilla elit cursus sed. Maecenas sit amet tincidunt elit. Integer commodo est at lacus facilisis aliquam. Etiam in enim at massa imperdiet eleifend ac eu quam.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vehicula tellus vel eleifend lacinia. Nunc vestibulum eu elit ac fringilla. Praesent ut ornare purus, nec porta nunc. Donec malesuada lacinia orci, non fringilla elit cursus sed. Maecenas sit amet tincidunt elit. Integer commodo est at lacus facilisis aliquam. Etiam in enim at massa imperdiet eleifend ac eu quam.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vehicula tellus vel eleifend lacinia. Nunc vestibulum eu elit ac fringilla. Praesent ut ornare purus, nec porta nunc. Donec malesuada lacinia orci, non fringilla elit cursus sed. Maecenas sit amet tincidunt elit. Integer commodo est at lacus facilisis aliquam. Etiam in enim at massa imperdiet eleifend ac eu quam.',
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam vehicula tellus vel eleifend lacinia. Nunc vestibulum eu elit ac fringilla. Praesent ut ornare purus, nec porta nunc. Donec malesuada lacinia orci, non fringilla elit cursus sed. Maecenas sit amet tincidunt elit. Integer commodo est at lacus facilisis aliquam. Etiam in enim at massa imperdiet eleifend ac eu quam.',
    ]
  };
  Widget _header(context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: 350.0,
          child: Image.asset(
            'assets/images/curry.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 0.0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Card(
              elevation: 10,
              margin: const EdgeInsets.all(8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        recipe['title'],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8.0,
                      bottom: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Row(children: <Widget>[
                          Text(
                          'Prep Time: ',
                        ),
                        Text(
                          '${recipe['cook-times']['prep'].toString()}',
                        ),
                        ],),
                        Row(children: <Widget>[
                          Text(
                          'Cook Time: ',
                        ),
                        Text(
                          '${recipe['cook-times']['cook'].toString()}',
                        ),
                        ],),
                        Row(children: <Widget>[
                          Text(
                          'Total Time: ',
                        ),
                        Text(
                          '${(recipe['cook-times']['prep'] + recipe['cook-times']['cook']).toString()}',
                        ),
                        ],),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
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
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('${(i + 1).toString()}.'),
              SizedBox(
                width: 15.0,
              ),
              Expanded(child: Text(strings[i]))
            ],
          ),
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
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('${strings[i]['quantity'].toString()} ${strings[i]['measurement'].toString()}'),
              SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: Text('${strings[i]['name'].toString()}'),
              ),
            ],
          ),
        ),
      );
    }
    return list;
  }

  Widget _body(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: <Widget>[
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
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              // header
              _header(context),
              SizedBox(height: 10.0,),
              _body(context),
            ],
          ),
        ),
      ),
    );
  }
}

class Bullet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 5.0,
      width: 5.0,
      decoration: new BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
