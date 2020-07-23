import 'package:upsavemvp/meal_plan_select_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'meal_card.dart';
import 'top_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final _firestore = Firestore.instance;

class HomeContent extends StatelessWidget {
  const HomeContent({
    Key key,
  }) : super(key: key);

  void getMeals() async {
    final meals = await _firestore.collection('recipes').getDocuments();
    for (var meal in meals.documents) {
      print(meal.data);
    }
  }

  @override
  Widget build(BuildContext context) {
    getMeals();
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
