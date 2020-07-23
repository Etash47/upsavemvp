import 'package:upsavemvp/meal_plan_select_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'meal_card.dart';
import 'top_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'recipe_class.dart';

final _firestore = Firestore.instance;

List<Recipe> meals = [];

class HomeContent extends StatefulWidget {
  const HomeContent({
    Key key,
  }) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  void getMeals() async {
    meals = [];

    final selected_meal_plan = await _firestore
        .collection('meal_plans')
        .where('name', isEqualTo: 'Pesca Passion')
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

  @override
  void initState() {
    super.initState();
    getMeals();
  }

  @override
  Widget build(BuildContext context) {
    print("Meals: ");
    print(meals.length);
    return Column(
      children: <Widget>[
        //Top App Bar
        TopBar(
          header: "UpSave",
          subheader: "Your Savings",
          subheader_content: "\$52.30",
        ),
        //Middle Meals Section

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                HeaderText(
                  text: 'My Meal Plan',
                ),
                Card(
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'TofuTastic',
                          style: TextStyle(fontSize: 16),
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward_ios),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return MealPlanSelectPage();
                                },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                //Meals
                HeaderText(
                  text: 'Meals',
                ),

                Expanded(
                  flex: 1,
                  child: Scrollbar(
                    child: GridView.count(
                      crossAxisCount: 2,
                      padding: EdgeInsets.all(8),
                      children: <Widget>[
                        for (var meal in meals)
                          MealCard(meal_name: meal.recipe_name)
                      ],
                    ),
                  ),
                ),
                //Row 1
//                Row(
//                  children: <Widget>[
//                    MealCard(),
//                    MealCard(),
//                  ],
//                ),
                //Row 2
//                Row(
//                  children: <Widget>[
//                    MealCard(),
//                    MealCard(),
//                  ],
//                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
