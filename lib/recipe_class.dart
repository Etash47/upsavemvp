import 'package:flutter/material.dart';

class Recipe {
  String recipe_name;
  int serving_size;
  int prep_time;
  String category;

  List<dynamic> ingredients;
  List<dynamic> instructions;

  Recipe({
    this.recipe_name,
    this.serving_size,
    this.prep_time,
    this.category,
    this.ingredients,
    this.instructions,
  });
}
