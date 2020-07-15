import 'package:flutter/material.dart';
import 'top_bar.dart';

class MealPlanViewPage extends StatefulWidget {
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
            header: "TofuTastic",
            subheader: "View Plan",
            subheader_content: null,
            back_button: true,
          )
        ],
      ),
    );
  }
}
