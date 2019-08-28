import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/ui/login/page_login.dart';
import 'package:flutter_app/ui/login/page_signup.dart';
import 'background.dart';

class LoginSignupPage extends StatefulWidget {
  LoginSignupPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginSignupPageState createState() => _LoginSignupPageState();
}

class _LoginSignupPageState extends State<LoginSignupPage> {
  final String background = 'assets/images/bg_login.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Colors.white,
        body: Container(
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/shop2.jpeg'), fit: BoxFit.fill)),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                color: Colors.black.withOpacity(0.6),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 80),
                child:
                Column(mainAxisAlignment: MainAxisAlignment.end, children: <
                    Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignupPage()));
                    },
                    child: Container(
                      margin: const EdgeInsets.all(20.0),
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white70),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      child: Container(
//                        padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                        width: 300,
                        child: Text(
                          "Signup",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 22.0,
                              color: Colors.white70),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 1.5,
                          color: Colors.white30,
                          margin: EdgeInsets.only(right: 10),
                        ),
                        Text("OR SKIP",
                            style:
                            TextStyle(color: Colors.white54, fontSize: 12)),
                        Container(
                          width: 100,
                          height: 1.5,
                          color: Colors.white30,
                          margin: EdgeInsets.only(left: 10),
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => LoginPage()));
                      },
                      child: Container(
                          margin: EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white70),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Container(
//                        padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                            width: 300,
                            child: Text(
                              "Login",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 22.0,
                                  color: Colors.white70),
                            ),
                          )),
                  )
                ]),
              )
            ],
          ),
        ));
  }
}
