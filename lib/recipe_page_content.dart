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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Container(
        color: Colors.red,
      ),
    );
  }
}

class InstructionsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      child: Container(
        color: Colors.blue,
      ),
    );
  }
}
