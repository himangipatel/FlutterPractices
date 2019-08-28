import 'package:flutter/material.dart';
import 'package:flutter_app/ui/page_splash.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter UI Collections',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor : Color(0xff172C4B)
      ),
      home: CollectionApp(),
    );
  }
}

class CollectionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Theme.of(context).primaryColor,
        ),
        home: SplashPage());
  }
}
