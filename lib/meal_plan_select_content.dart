import 'package:flutter/material.dart';
import 'top_bar.dart';

class MealPlanSelectPage extends StatefulWidget {
  @override
  _MealPlanSelectPageState createState() => _MealPlanSelectPageState();
}

class _MealPlanSelectPageState extends State<MealPlanSelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TopBar(
            header: "Meal Plans",
            subheader: null,
            subheader_content: null,
            back_button: true,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: HeaderText(
              text: "Tap a plan to view meals",
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10),
              children: <Widget>[
                MealPlanListItem(
                  title: "Tofutastic",
                  subtitle:
                      "Recipes from Asia, Africa, Europe, and the Americas",
                ),
                MealPlanListItem(
                  title: "Baller Beef",
                  subtitle: "Beef Recipes for protein and deliciousness",
                ),
                MealPlanListItem(
                  title: "Hot Chicks",
                  subtitle:
                      "Classic and cost-effective chicken recipes: an UpSave Classic",
                ),
                MealPlanListItem(
                  title: "Veggie Turbo",
                  subtitle:
                      "A Vegan meal plan that works with gluten-free and other allergies.",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MealPlanListItem extends StatefulWidget {
  final String title;
  final String subtitle;

  MealPlanListItem({this.title, this.subtitle});

  @override
  _MealPlanListItemState createState() => _MealPlanListItemState();
}

class _MealPlanListItemState extends State<MealPlanListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.title),
        subtitle: Text(widget.subtitle),
        isThreeLine: true,
        trailing: Column(
          children: <Widget>[
            RaisedButton(
              child: Text(
                "Select",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
