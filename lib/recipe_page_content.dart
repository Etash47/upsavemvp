import 'package:flutter/material.dart';
import 'top_bar.dart';

class RecipePage extends StatefulWidget {
  final String recipe_name;

  RecipePage({this.recipe_name});

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TopBar(
            header: widget.recipe_name,
            subheader: "Recipe",
            subheader_content: null,
            back_button: true,
          ),
        ],
      ),
    );
  }
}
