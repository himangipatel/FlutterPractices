import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/login/page_signup.dart';
import 'package:flutter_app/ui/page_welcome.dart';
import 'package:flutter_app/utils/adapt.dart';
import 'package:flutter_app/utils/colors.dart';
import 'package:flutter_app/utils/hexcolor.dart';

import '../page_dashboard.dart';
import '../page_uiwidget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Widget inputWidget(
        {String hintText,
        FocusNode focusNode,
        TextEditingController controller,
        TextInputAction textInputAction,
        Icon icon,
        bool obscureText = false}) {
      return new Container(
        margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: new TextFormField(
          focusNode: focusNode,
          onFieldSubmitted: (term) {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          obscureText: obscureText,
          cursorWidth: 1.5,
          cursorColor: primary300,
          textAlign: TextAlign.start,
          textInputAction: textInputAction,
          autofocus: true,
          controller: controller,
          decoration: new InputDecoration(
            prefixIcon: icon,
            contentPadding: const EdgeInsets.symmetric(vertical: 14),
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 13.0),
          ),
        ),
      );
    }

    return new Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/shop2.jpeg'),
                      fit: BoxFit.fill)),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.black.withOpacity(0.6),
            ),
            Container(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: Adapt.screenH(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      SizedBox(
                        height: 200,
                      ),
                      new Padding(
                        padding: new EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: inputWidget(
                            hintText: 'Email',
                            focusNode: FocusNode(),
                            icon: Icon(Icons.email),
                            textInputAction: TextInputAction.next),
                      ),
                      new Padding(
                        padding: new EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        child: inputWidget(
                            hintText: 'Password',
                            focusNode: FocusNode(),
                            icon: Icon(Icons.vpn_key),
                            textInputAction: TextInputAction.next),
                      ),
                      Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Don't have account? ",
                                style: TextStyle(color: Colors.white),
                              ),
                              InkWell(
                                child: Text(
                                  "Signup",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline),
                                ),
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => SignupPage()));
                                },
                              )
                            ],
                          )),
                      SizedBox(
                        width: double.infinity,
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Color(0xff172C4B),Color(0xff5F4B9B)],
                                begin: FractionalOffset(0.0, 0.0),
                                end: FractionalOffset(0.5, 0.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          margin: EdgeInsets.fromLTRB(35, 50, 35, 0),
                          child: RaisedButton(
                            color: Colors.white10,
                            padding: EdgeInsets.all(15),
                            child: Text(
                              "Sign In".toUpperCase(),
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => DashboardPage()));
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
