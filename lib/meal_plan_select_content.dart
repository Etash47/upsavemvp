import 'package:flutter/material.dart';
import 'top_bar.dart';
import 'meal_plan_view_page_content.dart';

int selectedPlan = 0;

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
                  planID: 0,
                  selected: (0 == selectedPlan),
                  parent: this,
                ),
                MealPlanListItem(
                  title: "Baller Beef",
                  subtitle: "Beef Recipes for protein and deliciousness",
                  planID: 1,
                  selected: (1 == selectedPlan),
                  parent: this,
                ),
                MealPlanListItem(
                  title: "Hot Chicks",
                  subtitle:
                      "Classic and cost-effective chicken recipes: an UpSave Classic",
                  planID: 2,
                  selected: (2 == selectedPlan),
                  parent: this,
                ),
                MealPlanListItem(
                  title: "Veggie Turbo",
                  subtitle:
                      "A Vegan meal plan that works with gluten-free and other allergies.",
                  planID: 3,
                  selected: (3 == selectedPlan),
                  parent: this,
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
  final int planID;
  final bool selected;
  final _MealPlanSelectPageState parent;

  MealPlanListItem(
      {this.title, this.subtitle, this.planID, this.selected, this.parent});

  @override
  _MealPlanListItemState createState() => _MealPlanListItemState();
}

class _MealPlanListItemState extends State<MealPlanListItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return MealPlanViewPage(
                meal_plan_name: widget.title,
              );
            },
          ),
        );
      },
      child: Card(
        child: ListTile(
          title: Text(widget.title),
          subtitle: Text(widget.subtitle),
          isThreeLine: true,
          trailing: Column(
            children: <Widget>[
              RaisedButton(
                child: Text(
                  widget.selected ? "Selected" : "Select",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  widget.parent.setState(() {
                    selectedPlan = widget.planID;
                  });
                },
                color:
                    widget.selected ? green_accent_color : Colors.grey.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
