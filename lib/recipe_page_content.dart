import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'top_bar.dart';

class RecipePage extends StatefulWidget {
  final String recipe_name;

  RecipePage({this.recipe_name});

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  List<Widget> _myAnimatedWidgets = [
    IngredientsWidget(),
    InstructionsWidget(),
  ];

  int selectorValue = 0;

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
              child: _myAnimatedWidgets[selectorValue],
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
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        IngredientListTile(),
        IngredientListTile(),
        IngredientListTile(),
        IngredientListTile(),
        IngredientListTile(),
        IngredientListTile(),
        IngredientListTile(),
        IngredientListTile(),
        IngredientListTile(),
      ],
    );
  }
}

class InstructionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10),
      children: <Widget>[
        InstructionsListTile(),
        InstructionsListTile(),
        InstructionsListTile(),
        InstructionsListTile(),
        InstructionsListTile(),
        InstructionsListTile(),
        InstructionsListTile(),
        InstructionsListTile(),
      ],
    );
  }
}

class IngredientListTile extends StatelessWidget {
  const IngredientListTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("Ingredient"),
        subtitle: Text("Amount"),
      ),
    );
  }
}

class InstructionsListTile extends StatelessWidget {
  const InstructionsListTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: ListTile(
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
            child: Text("Step 1"),
          ),
          subtitle: Text(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
        ),
      ),
    );
  }
}
