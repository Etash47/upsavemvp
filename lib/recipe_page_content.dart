import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'top_bar.dart';
import 'recipe_class.dart';

class RecipePage extends StatefulWidget {
  final Recipe recipeObject;

  RecipePage({this.recipeObject});

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  int selectorValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TopBar(
            header: widget.recipeObject.recipe_name,
            subheader: "Recipe",
            subheader_content: null,
            back_button: true,
          ),
          SizedBox(height: 30),
          Row(
            children: <Widget>[
              Expanded(
                child: CupertinoSegmentedControl(
                  onValueChanged: (int value) {
                    setState(() {
                      selectorValue = value;
                    });
                  },
                  children: <int, Widget>{
                    0: Text("Ingredients"),
                    1: Text("Instructions"),
                  },
                  groupValue: selectorValue,
                  selectedColor: green_accent_color,
                  borderColor: green_accent_color,
                ),
              ),
            ],
          ),
          Expanded(
            child: AnimatedSwitcher(
              child: [
                IngredientsWidget(widget.recipeObject),
                InstructionsWidget(widget.recipeObject),
              ][selectorValue],
              duration: Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class IngredientsWidget extends StatelessWidget {
  final Recipe recipeObject;

  IngredientsWidget(this.recipeObject);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        for (var ingredient in recipeObject.ingredients)
          IngredientListTile(ingredient)
      ],
    );
  }
}

class InstructionsWidget extends StatelessWidget {
  final Recipe recipeObject;
  InstructionsWidget(this.recipeObject);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: getInstructionTiles(recipeObject),
    );
  }
}

List<Widget> getInstructionTiles(Recipe recipeObject) {
  List<Widget> children = [];

  int i = 0;
  for (var instruction in recipeObject.instructions) {
    children.add(InstructionsListTile(instruction.toString(), i));
    i += 1;
  }

  return children;
}

class IngredientListTile extends StatelessWidget {
  final dynamic ingredient;
  String ingredientName;
  double ingredientAmount;
  String ingredientUnit;

  IngredientListTile(this.ingredient) {
    var ingredientMap = ingredient as Map<String, dynamic>;
    ingredientName = ingredientMap['ingredient'];
    ingredientAmount = double.parse(ingredientMap['amount'].toString());
    ingredientUnit = ingredientMap['units'];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(ingredientName),
        subtitle: Text(ingredientAmount.toString() + " " + ingredientUnit),
      ),
    );
  }
}

class InstructionsListTile extends StatelessWidget {
  final String instruction;
  final int instructionNumber;

  InstructionsListTile(this.instruction, this.instructionNumber);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
            child: Text("Step $instructionNumber"),
          ),
          subtitle: Text(instruction),
        ),
      ),
    );
  }
}
