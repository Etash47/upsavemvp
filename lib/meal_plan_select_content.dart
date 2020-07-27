import 'package:flutter/material.dart';
import 'package:upsavemvp/home_content.dart';
import 'top_bar.dart';
import 'meal_plan_view_page_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'home_content.dart';

final _firestore = Firestore.instance;

int selectedPlan = 0;

List<dynamic> meal_plans = [];

class MealPlanSelectPage extends StatefulWidget {
  @override
  _MealPlanSelectPageState createState() => _MealPlanSelectPageState();
}

class _MealPlanSelectPageState extends State<MealPlanSelectPage> {
  void getMealPlans() async {
    meal_plans = [];

    final fb_meal_plans =
        await _firestore.collection('meal_plans').getDocuments();

    for (var mp in fb_meal_plans.documents) {
      var map = {
        'id': mp.reference.documentID,
        'name': mp.data['name'],
        'description': mp.data['description'],
      };

      setState(() {
        meal_plans.add(map);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getMealPlans();
  }

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
              children: generateMealCards(),
            ),
          ),
        ],
      ),
    );
  }

  List generateMealCards() {
    List<Widget> list = new List<Widget>();

    int i = 0;

    for (var mp in meal_plans) {
      var temp = MealPlanListItem(
        title: mp['name'],
        subtitle: mp['description'],
        planID: i,
        selected: (i == selectedPlan),
        parent: this,
      );

      list.add(temp);

      i += 1;
    }

    return list;
  }
}

void changeMealPlanGlobally(context) {
  var new_plan = meal_plans[selectedPlan]['name'];
  MealPlanInheritance.of(context).changeMealPlan(new_plan);
  print("Changed to $new_plan");
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
                mealPlanName: widget.title,
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
                    setState(() {
                      changeMealPlanGlobally(context);
                    });
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
