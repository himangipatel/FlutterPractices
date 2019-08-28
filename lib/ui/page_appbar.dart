import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/utils/colors.dart';

class AppBarPage extends StatelessWidget {
  // final String text;

//  AppBarPage({Key key, @required this.text}) : super(key: key);

//  @override
//  _AppBarPageState createState() => _AppBarPageState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Example title'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search, color: Colors.white),
              tooltip: 'Search',
              onPressed: null,
            ),
            IconButton(
              icon: Icon(
                Icons.delete,
                color: Colors.white,
              ),
              tooltip: 'Search',
              onPressed: null,
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.red,
                height: 100,
                width: 100,
              ),
              Expanded(
                child: Container(
                  color: Colors.blue,
                  width: 100,
                ),
              ),
              Container(
                color: Colors.red,
                height: 100,
                width: 100,
              ),
            ],
          ),
        ));
  }
}

/*
Types of Layout:

Imagine you’re creating a layout of an app. You may broadly classify parts of it into two types:

· Static layout: It doesn’t change once the app is built. Like a title bar or a line of text.
  You wouldn’t want any form of user activity to change the title bar of the app, right?

· Dynamic layout: The layout that has the ability to change, based on user activity,
  an ongoing hidden process (among other factors). Think of the favorite icon in a movie review app.
  When you tap the favorite icon of a particular movie, its star icon fills up with color and the total count of favorites increases.
  Meaning that because of some user activity, the layout changed.

  So naturally, flutter made two widgets to accommodate them.These are StatelessWidget and StatefulWidget.
  They provide different properties to the app.
  StatelessWidget is used for the static layout whereas a stateful widget is used for the dynamic part of the layout.

*/