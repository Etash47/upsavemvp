import 'package:flutter/material.dart';
import 'top_bar.dart';

class AccountPageContent extends StatefulWidget {
  @override
  _AccountPageContentState createState() => _AccountPageContentState();
}

class _AccountPageContentState extends State<AccountPageContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TopBar(
          header: "My Account",
          subheader: "Barack Obama",
          subheader_content: null,
        ),
        Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
              SizedBox(
                height: 25,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
