import 'package:flutter/material.dart';
import 'top_bar.dart';
import 'meal_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'recipe_class.dart';

final _firestore = Firestore.instance;
List<Recipe> meals = [];

class MealPlanViewPage extends StatefulWidget {
  final String mealPlanName;
  MealPlanViewPage({this.mealPlanName});

  @override
  _MealPlanViewPageState createState() => _MealPlanViewPageState();
}

class _MealPlanViewPageState extends State<MealPlanViewPage> {
  void getMeals() async {
    meals = [];

    final selected_meal_plan = await _firestore
        .collection('meal_plans')
        .where('name', isEqualTo: widget.mealPlanName)
        .getDocuments();

    final selected_recipe_ids =
        await selected_meal_plan.documents[0].data['recipes'];

    for (var sr_id in selected_recipe_ids) {
      var selected_meal_ref =
          await _firestore.collection('recipes').document(sr_id);

      await selected_meal_ref.get().then((datasnapshot) {
        if (datasnapshot.exists) {
          var data = datasnapshot.data;
          Recipe recipe = Recipe(
            recipe_name: data["recipe_name"],
            serving_size: data["serving_size"],
            prep_time: data["prep_time"],
            category: data["category"],
            ingredients: data["ingredients"],
            instructions: data["instructions"],
          );

          print("adding");
          setState(() {
            meals.add(recipe);
          });
        }
      });
    }

    print(meals.length);
  }

  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      this.getMeals();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          TopBar(
            header: widget.mealPlanName,
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
                  for (var meal in meals) MealCard(recipeObject: meal)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
