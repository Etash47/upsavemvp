import 'package:flutter/material.dart';
import 'top_bar.dart';

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
          )
        ],
      ),
    );
  }
}
