import 'package:my_kitchen/models/cook-time.dart';
import 'package:my_kitchen/models/ingredient.dart';

class Recipe {
  String title;
  String description;
  List<Ingredient> ingredients;
  List<String> steps;
  CookTime cookTime;
}