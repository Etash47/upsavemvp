import 'meal_card.dart';
import 'top_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_ingredient_page_content.dart';

class PantryPageContent extends StatefulWidget {
  const PantryPageContent({
    Key key,
  }) : super(key: key);

  @override
  _PantryPageContentState createState() => _PantryPageContentState();
}

class _PantryPageContentState extends State<PantryPageContent> {
  String dropdownValue = 'All';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //Top App Bar
        TopBar(
          header: "Pantry",
          subheader: "Ingredients at Home",
          subheader_content: null,
        ),

        Card(
          margin: EdgeInsets.all(15),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Category',
                  style: TextStyle(fontSize: 18),
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['Dairy', 'Produce', 'Packaged Goods', 'All']
                      .map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
          ),
        ),

        Expanded(
          child: ListView(
            padding: EdgeInsets.all(10),
            children: <Widget>[
              PantryListItem('Banana', 5, 'Whole'),
              PantryListItem('Eggs', 36, 'Whole'),
              PantryListItem('Flour', 1, 'Pound'),
              PantryListItem('Sugar', 16, 'Ounces'),
              PantryListItem('Baking Soda', 8, 'Ounces'),
            ],
          ),
        ),

        Card(
          margin: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Add an Ingredient',
                  style: TextStyle(fontSize: 16),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return AddIngredientPage();
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),

        //Middle Meals Section
      ],
    );
  }
}

class PantryListItem extends StatefulWidget {
  final String name;
  int quantity;
  final String unit;

  PantryListItem(this.name, this.quantity, this.unit);

  @override
  _PantryListItemState createState() => _PantryListItemState();
}

class _PantryListItemState extends State<PantryListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(widget.name),
        subtitle: Text(widget.unit),
        trailing: Container(
          width: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    if (widget.quantity < 100) widget.quantity += 1;
                  });
                },
              ),
              Container(
                width: 30,
                child: Center(child: Text(widget.quantity.toString())),
              ),
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    if (widget.quantity > 0) widget.quantity -= 1;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
