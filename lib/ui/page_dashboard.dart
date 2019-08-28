import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/ui/page_networkcall.dart';

import 'package:flutter_app/ui/page_welcome.dart';
import 'package:flutter_app/utils/hexcolor.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _selectedIndex = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  List<Widget> _widgetOptions = <Widget>[
    WelcomePage(),
    Center(
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
    )
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: HexColor('#172C4B'),
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          tooltip: 'Navigation menu',
          onPressed: () => _scaffoldKey.currentState.openDrawer(),
        ),
        title: Text('Example title'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
                child: FadeInImage.assetNetwork(
              placeholder: 'assets/loader.gif',
              image: 'https://media.giphy.com/media/Im2w7xSb9kQzC/giphy.gif',
              fit: BoxFit.fill,
            )),
            ListTile(
              title: Text('Home'),
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Setting'),
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: HexColor('#172C4B'),
        onTap: _onItemTapped,
      ),
    );
  }
}
