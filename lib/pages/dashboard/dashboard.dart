import 'package:flutter/material.dart';
import 'package:my_kitchen/models/recipe.dart';
import 'package:my_kitchen/pages/recipe/recipe-page.dart';
import 'package:my_kitchen/utils/star-rating.dart';
import 'package:provider/provider.dart';
import 'package:my_kitchen/pages/side-navigation/side-navigation.dart';
import 'package:my_kitchen/services/theme/theme.dart';
import 'package:my_kitchen/theme/themed-page.dart';

class Dashboard extends StatelessWidget {
  static String tag = '/dashboard';

  @override
  Widget build(BuildContext context) {
    final double rating = 3.5;
    final maxRating = 5;

    final makeListTile = IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 145.0,
            width: 145.0,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: Ink.image(
                    image: AssetImage('assets/images/curry.jpg'),
                    fit: BoxFit.cover,
                    child: Container(),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: DefaultTextStyle(
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Chickpea Curry',
                      style: TextStyle().copyWith(
                          color: Colors.black54,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Text(
                        'city',
                        style: TextStyle().copyWith(color: Colors.black45),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        StarRating(
                          starCount: maxRating,
                          rating: rating,
                        ),
                        Text('$rating / $maxRating')
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    final makeCard = new GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(RecipePage.tag);
      },
      child: Card(
        elevation: 4.0,
        margin: new EdgeInsets.all(
          12.0,
        ),
        child: Container(
          child: makeListTile,
        ),
      ),
    );

    return ThemedPage(
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
        child: Container(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return makeCard;
            },
          ),
        ),
      ),
    );
  }
}
