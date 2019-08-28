import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/ui/page_networkcall.dart';
import 'package:flutter_app/ui/page_appbar.dart';

import 'package:flutter_app/ui/page_uiwidget.dart';
import 'package:flutter_app/utils/colors.dart';
import 'package:flutter_app/utils/strings.dart';

import 'demo.dart';
import 'login/page_loginsignup.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Widget _buildButton(String btnLabel, {Function onClick}) {
      return MaterialButton(
        minWidth: 250.0,
        onPressed: () {
          onClick();
        },
        colorBrightness: Brightness.light,
        color: Colors.blue,
        elevation: 10.0,
        splashColor: Colors.lightBlue,
        //highlightColor: Colors.red,
        highlightElevation: 1.0,
        child: Text(
          btnLabel,
          style: TextStyle(color: Colors.white),
        ),
      );
    }

    return Scaffold(
        body: SingleChildScrollView(
      child: new Center(
        child: AnnotatedRegion(
            value: SystemUiOverlayStyle(
                statusBarColor: colorPrimary,
                statusBarBrightness: Brightness.light,
                statusBarIconBrightness: Brightness.dark,
                systemNavigationBarIconBrightness: Brightness.light,
                systemNavigationBarColor: Colors.blue),
            child: Container(
              color: Colors.white,
              child: SafeArea(
                  top: true,
                  bottom: false,
                  child: Column(
                    children: <Widget>[
                      _buildButton(labelAppbar,
                          onClick: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => AppBarPage()))
                              }),
                      _buildButton(labelUIWidget,
                          onClick: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UIWidgetPage()))
                              }),
                      _buildButton("Design",
                          onClick: () => {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DemoPage()))
                              }),
                      _buildButton("Network Call",
                          onClick: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NetworkCalling()))
                          }),
                      Form(
                          key: _formKey,
                          child: TextFormField(
                            // The validator receives the text that the user has entered.
                            validator: validateName,
                          )),
                      RaisedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, otherwise false.
                          if (_formKey.currentState.validate()) {
                            // If the form is valid, display a snackbar. In the real world,
                            // you'd often call a server or save the information in a database.

                            Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text('Processing Data')));
                          }
                        },
                        child: Text('Submit'),
                      )
                    ],
                  )),
            )),
      ),
    ));
  }
  String validateName(String value) {
    String patttern = r'(^[a-zA-Z ]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Name is Required";
    } else if (!regExp.hasMatch(value)) {
      return "Name must be a-z and A-Z";
    }
    return null;
  }
}
