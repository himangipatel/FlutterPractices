import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/ui/login/page_login.dart';
import 'package:flutter_app/ui/model/model_register.dart';
import 'package:flutter_app/utils/Constants.dart';
import 'package:flutter_app/utils/adapt.dart';
import 'package:flutter_app/utils/colors.dart';
import 'package:flutter_app/utils/hexcolor.dart';
import 'package:flutter_app/utils/util.dart';
import 'package:flutter_app/utils/validator.dart';
import 'package:flutter_app/widgets/boxTextField.dart';
import 'package:flutter_app/widgets/gradientButton.dart';
import 'package:http/http.dart' as http;

import '../page_dashboard.dart';

class Register {
  final String name;
  final String email;
  final String password;
  final String deviceType;
  final String message;
  final bool isSuccess;

  Register._(
      {this.name,
      this.email,
      this.password,
      this.deviceType,
      this.message,
      this.isSuccess});

  factory Register.fromJson(Map<String, dynamic> json) {
    return new Register._(
        message: json['message'], isSuccess: json['isSuccess']);
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
  String _email, _password, _name;

  GlobalKey<FormState> _key = new GlobalKey();
  TextEditingController _nameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  FocusNode _nameFocusNode = new FocusNode();
  FocusNode _emailFocusNode = new FocusNode();
  FocusNode _passFocusNode = new FocusNode();

  Future<Register> callRegisterAPI(String url, {Map body}) async {
    return http.post(url, body: body).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      print(response.body);
      return Register.fromJson(json.decode(response.body));
    });
  }

  BoxTextField _fullNameWidget() {
    return BoxTextField(
      controller: _nameController,
      focusNode: _nameFocusNode,
      hintText: "Enter Name",
      obscureText: false,
      onSaved: (String val) {
        _name = val;
      },
      validator: (val) => validateName(val),
      onFieldSubmitted: (String value) {
        FocusScope.of(context).requestFocus(_emailFocusNode);
      },
      icon: Icons.person,
    );
  }

  BoxTextField _emailWidget() {
    return BoxTextField(
      controller: _emailController,
      focusNode: _emailFocusNode,
      hintText: "Enter email",
      obscureText: false,
      onSaved: (String val) {
        _email = val;
      },
      validator: (val) => validateEmail(val),
      onFieldSubmitted: (String value) {
        FocusScope.of(context).requestFocus(_passFocusNode);
      },
      icon: Icons.email,
    );
  }

  BoxTextField _passwordWidget() {
    return BoxTextField(
        controller: _passwordController,
        focusNode: _passFocusNode,
        hintText: "Enter Password",
        obscureText: true,
        onSaved: (String val) {
          _password = val;
        },
        validator: (val) => validatePassword(val),
        onFieldSubmitted: (String value) {},
        icon: Icons.lock_outline);
  }

  GradientButton _signUpWidget() {
    return GradientButton(
        buttonLabel: "Sign up",
        colors: [HexColor('#172C4B'), HexColor('#5F4B9B')],
        onPressed: () async {
          if (Utils.checkConnection() != null) {
            if (_key.currentState.validate()) {
              _key.currentState.save();
              Register newPost = new Register._(
                  name: _name,
                  email: _email,
                  password: _password,
                  deviceType: "android");
              Register p = await callRegisterAPI(Constants.REGISTER_API, body: newPost.toMap());

              if (p.isSuccess) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DashboardPage()));
              } else {
                showDialog(
                    context: context,
                    builder: (_) => new AlertDialog(
                          title: new Text("Error"),
                          content: new Text(p.message),
                        ));
              }

              print(p.message);
            }
          }else{
            showDialog(
                context: context,
                builder: (_) => new AlertDialog(
                  title: new Text("No Internet Connection"),
                ));
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    Widget FormUI() {
      return Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            height: 200,
          ),
          _fullNameWidget(),
          _emailWidget(),
          _passwordWidget(),
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
                  ),
                ],
              )),
          _signUpWidget()
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
