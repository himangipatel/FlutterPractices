import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/login/page_login.dart';
import 'package:flutter_app/utils/adapt.dart';
import 'package:flutter_app/utils/colors.dart';
import 'package:flutter_app/utils/hexcolor.dart';
import 'package:flutter_app/utils/validator.dart';
import 'package:http/http.dart' as http;

import '../page_dashboard.dart';

class Register {
  final String name;
  final String email;
  final String password;
  final String deviceType;

  Register._({this.name, this.email, this.password, this.deviceType});

  factory Register.fromJson(Map<String, dynamic> json) {
    return new Register._(name: json['message']);
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["name"] = name;
    map["email"] = email;
    map["password"] = password;
    map["deviceType"] = deviceType;

    return map;
  }
}

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String _email;
  String _password;
  String _name;

  GlobalKey<FormState> _key = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    Widget inputWidget(
        {String hintText,
          FocusNode focusNode,
          TextEditingController controller,
          TextInputAction textInputAction,
          Icon icon,
          bool obscureText = false,
          FormFieldValidator<String> validator,
          FormFieldSetter<String> onSaved}) {
      return new Container(
        margin: EdgeInsets.fromLTRB(25, 0, 25, 0),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(8)),
        child: new TextFormField(
            onSaved: onSaved,
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
                contentPadding:
                const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(fontSize: 13.0)),
            validator: validator),
      );
    }

    Future<Register> createPost(String url, {Map body}) async {
      return http.post(url, body: body).then((http.Response response) {
        final int statusCode = response.statusCode;

        if (statusCode < 200 || statusCode > 400 || json == null) {
          throw new Exception("Error while fetching data");
        }
        print(response.body);
        return Register.fromJson(json.decode(response.body));
      });
    }

    Widget FormUI() {
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: 200,
          ),
          new Padding(
            padding: new EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: inputWidget(
              hintText: 'Fullname',
              focusNode: FocusNode(),
              icon: Icon(Icons.sort_by_alpha),
              textInputAction: TextInputAction.next,
              validator: (val) => validateName(val),
              onSaved: (val) => _name = val,
            ),
          ),
//          new Padding(
//            padding: new EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//            child: inputWidget(
//              hintText: 'Email',
//              focusNode: FocusNode(),
//              icon: Icon(Icons.email),
//              textInputAction: TextInputAction.next,
//              validator: (val) => validateEmail(val),
//              onSaved: (val) => _email = val,
//            ),
//          ),
          new Padding(
            padding: new EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: TextFormField(
              focusNode: FocusNode(),
              onFieldSubmitted: (term) {
                FocusScope.of(context).requestFocus(FocusNode());
              },
              cursorWidth: 1.5,
              cursorColor: primary300,
              textAlign: TextAlign.start,
              textInputAction: TextInputAction.next,
              autofocus: true,
              decoration: new InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  contentPadding:
                  const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                  border: InputBorder.none,
                  hintText: 'Email',
                  hintStyle: TextStyle(fontSize: 13.0)),
              validator: (val) => validateEmail(val),
              onSaved: (val)=>_email = val,
            ),
          ),
          new Padding(
            padding: new EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: inputWidget(
              hintText: 'Password',
              focusNode: FocusNode(),
              icon: Icon(Icons.vpn_key),
              textInputAction: TextInputAction.next,
              validator: (val) => validatePassword(val),
              onSaved: (val) => _password = val,
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Have Account? ",
                    style: TextStyle(color: Colors.white),
                  ),
                  InkWell(
                    child: Text(
                      "Signin",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                  )
                ],
              )),
          SizedBox(
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [HexColor('#172C4B'), HexColor('#5F4B9B')],
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
                  "Sign Up".toUpperCase(),
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if (_key.currentState.validate()) {

                  }

                },
              ),
            ),
          )
        ],
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
                  child: new Form(
                    key: _key,
                    child: FormUI(),
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
