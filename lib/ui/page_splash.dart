import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_app/utils/colors.dart';
import 'package:flutter_app/utils/strings.dart';

import 'login/page_loginsignup.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [colorPrimary, colorAccent],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft))),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 75,
              child: Icon(
                Icons.shopping_cart,
                color: /*Colors.deepOrange*/ colorPrimary,
                size: 50,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
            ),
            Text(
              labelSplash,
              style: TextStyle(color: Colors.white, fontSize: 24),
            )
          ],
        )
      ],
    ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      navigationPage();
    });
  }

  void navigationPage() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginSignupPage()));
  }
}
