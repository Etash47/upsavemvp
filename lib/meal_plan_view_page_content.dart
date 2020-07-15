import 'package:flutter/material.dart';
import 'top_bar.dart';
import 'meal_card.dart';

class MealPlanViewPage extends StatefulWidget {
  final String meal_plan_name;
  MealPlanViewPage({this.meal_plan_name});

  @override
  _MealPlanViewPageState createState() => _MealPlanViewPageState();
}

class _MealPlanViewPageState extends State<MealPlanViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TopBar(
            header: widget.meal_plan_name,
            subheader: "View Plan",
            subheader_content: null,
            back_button: true,
          ),
          Expanded(
            flex: 1,
            child: Scrollbar(
              child: GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.all(8),
                children: <Widget>[
                  MealCard(),
                  MealCard(),
                  MealCard(),
                  MealCard(),
                  MealCard(),
                  MealCard(),
                  MealCard(),
                  MealCard(),
                  MealCard(),
                  MealCard(),
                  MealCard(),
                  MealCard(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
