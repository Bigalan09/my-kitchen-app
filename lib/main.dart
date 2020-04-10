import 'package:flutter/material.dart';
import 'package:recipe/pages/recipe/recipe.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RecipeViewPage(),
    );
  }
}