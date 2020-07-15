import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upsavemvp/account_page_content.dart';
import 'package:upsavemvp/grocery_page_content.dart';
import 'package:upsavemvp/pantry_page_content.dart';
import 'home_content.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomeContent(),
    GroceryPageContent(),
    PantryPageContent(),
    AccountPageContent(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: _children[_currentIndex],
      backgroundColor: Colors.grey.shade100,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Color(0xFF20CEBA),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_grocery_store),
            title: Text('Grocery Cart'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.kitchen),
            title: Text('Pantry'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('Account'),
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
