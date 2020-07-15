import 'package:flutter/material.dart';

class MealCard extends StatelessWidget {
  const MealCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      //elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Icon(
              Icons.fastfood,
              size: 60,
            ),
            SizedBox(height: 15.0),
            Text(
              "Meal",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 5.0),
            RaisedButton(
              child: Text(
                "Make This",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
