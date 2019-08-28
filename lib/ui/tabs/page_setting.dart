import 'package:flutter/material.dart';

class SettingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
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
      ),
    );
  }
}
