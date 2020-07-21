import 'package:flutter/material.dart';
import 'top_bar.dart';

class AddIngredientPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TopBar(
            header: "Pantry",
            subheader: "Add an Ingredient",
            subheader_content: null,
            back_button: true,
          )
        ],
      ),
    );
  }
}
