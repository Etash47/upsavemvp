import 'package:flutter/material.dart';
import 'recipe_page_content.dart';
import 'recipe_class.dart';

class MealCard extends StatelessWidget {
  final Recipe recipeObject;

  MealCard({this.recipeObject});

  @override
  Widget build(BuildContext context) {
    return Card(
      //elevation: 10,
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return RecipePage(recipeObject: recipeObject);
          }));
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/UpSave_Default_2.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              Text(
                recipeObject.recipe_name,
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 5.0),
            ],
          ),
        ),
      ),
    );
  }
}
