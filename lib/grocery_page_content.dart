import 'meal_card.dart';
import 'top_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GroceryPageContent extends StatelessWidget {
  const GroceryPageContent({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //Top App Bar
        TopBar(
          header: "Grocery Cart",
          subheader: "Ingredients to Buy",
          subheader_content: null,
        ),

        Expanded(
          child: ListView(
            padding: EdgeInsets.all(10),
            children: <Widget>[
              GroceryListItem('Banana', 5, 'Whole'),
              GroceryListItem('Eggs', 36, 'Whole'),
              GroceryListItem('Flour', 1, 'Pound'),
              GroceryListItem('Sugar', 16, 'Ounces'),
              GroceryListItem('Baking Soda', 8, 'Ounces'),
            ],
          ),
        ),

        //Middle Meals Section
      ],
    );
  }
}

class GroceryListItem extends StatefulWidget {
  final String name;
  final int quantity;
  final String unit;

  GroceryListItem(this.name, this.quantity, this.unit);

  @override
  _GroceryListItemState createState() => _GroceryListItemState();
}

class _GroceryListItemState extends State<GroceryListItem> {
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: CheckboxListTile(
        title: Text(widget.name),
        subtitle: Text(widget.quantity.toString() + ' ' + widget.unit),
        controlAffinity: ListTileControlAffinity.trailing,
        value: _checked,
        onChanged: (bool value) {
          setState(() {
            _checked = value;
          });
        },
        activeColor: Color(0xFF20CEBA),
      ),
    );
  }
}
