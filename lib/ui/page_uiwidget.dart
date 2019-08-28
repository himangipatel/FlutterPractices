import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utils/strings.dart';

class UIWidgetPage extends StatefulWidget {
  @override
  _UIWidgetPageSatate createState() => _UIWidgetPageSatate();
}

class _UIWidgetPageSatate extends State<UIWidgetPage> {
  int number = 0;
  int _radioValue1 = -1;
  int correctScore = 0;

  void subtractNumbers() {
    setState(() {
      number = number - 1;
    });
  }

  void addNumbers() {
    setState(() {
      number = number + 1;
    });
  }

  void _handleRadioValueChange1(int value) {
    setState(() {
      _radioValue1 = value;

      switch (_radioValue1) {
        case 0:
          print('Correct !');
          correctScore++;
          break;
        case 1:
          print('Try again  !');
          break;
        case 2:
          print('Try again  !');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(labelUIWidget),
        ),
        body: new SingleChildScrollView(
            child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              new Text(
                '$number',
                style: new TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 40.0,
                  fontFamily: 'Roboto',
                ),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new RaisedButton(
                    onPressed: addNumbers,
                    child: new Text("Add(RaisedButton)"),
                  ),
                  new FlatButton(
                    onPressed: subtractNumbers,
                    child: new Text(
                      "Subtract(FlatButton)",
                    ),
                  ),
                ],
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  new RaisedButton(
                    padding: const EdgeInsets.all(8.0),
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: addNumbers,
                    child: new Text("Add(RaisedButton)"),
                  ),
                  new FlatButton(
                    textColor: Colors.white,
                    color: Colors.red,
                    padding: const EdgeInsets.all(8.0),
                    onPressed: subtractNumbers,
                    child: new Text(
                      "Subtract(FlatButton)",
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
//                  FloatingActionButton(
//                    child: Icon(Icons.add),
//                    onPressed: (){
//                      print('You tapped on FloatingActionButton');
//                    },
//                  ),
                  FloatingActionButton.extended(
                    icon: Icon(Icons.add),
                    label: Text('I am Extended'),
                    onPressed: () {
                      print('You tapped on FloatingActionButton');
                    },
                  ),
                ],
              ),
              MaterialButton(
                minWidth: 250.0,
                onPressed: () {
                  /* _showToast(context,'Snackbar displaying');*/
                  _showToast(context, "button pressed");
                },
                colorBrightness: Brightness.light,
                color: Colors.blue,
                elevation: 10.0,
                splashColor: Colors.green,
                //highlightColor: Colors.red,
                highlightElevation: 1.0,
                child: Text(
                  "MaterialButton",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.clear, color: Colors.deepOrange),
                    tooltip: 'Increase volume by 10%',
                    onPressed: () {
                      setState(() {
                        number = 0;
                      });
                    },
                  ),
                  Icon(
                    Icons.thumb_up,
                    color: Colors.pink,
                    size: 30.0,
                  )
                ],
              ),
              InkWell(
                onTap: () {
                  print('Clicked on URL by InkWell Widget');
                },
                child: Text("https://quickstartflutterdart.blogspot.in/",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 13,
                        decoration: TextDecoration.underline)),
              ),
              Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Image.asset("assets/images/lake.jpg",
                        width: 150, height: 150),
                    Image.network('https://picsum.photos/250?image=9',
                        fit: BoxFit.cover, width: 150, height: 150),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/loader.gif',
                  image:
                      'https://media.giphy.com/media/Im2w7xSb9kQzC/giphy.gif',
                  width: 500,
                  height: 400,
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: TextEditingController(),
                      maxLines: 1,
                      autofocus: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "", labelText: lblEnterEmail),
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: TextEditingController(),
                      maxLines: 1,
                      maxLength: 8,
                      autofocus: false,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          hintText: "", labelText: lblEnterPassword),
                    )
                  ],
                ),
              ),
              Column(
                children: <Widget>[
                  new Text(
                    'Select correct answers from below:',
                    style: new TextStyle(
                        fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  new Padding(
                    padding: new EdgeInsets.all(8.0),
                  ),
                  new Divider(height: 5.0, color: Colors.black),
                  new Padding(
                    padding: new EdgeInsets.all(8.0),
                  ),
                  new Text(
                    'Lion is :',
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio(
                        value: 0,
                        groupValue: _radioValue1,
                        onChanged: _handleRadioValueChange1,
                      ),
                      new Text(
                        'Carnivore',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                      new Radio(
                        value: 1,
                        groupValue: _radioValue1,
                        onChanged: _handleRadioValueChange1,
                      ),
                      new Text(
                        'Herbivore',
                        style: new TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      new Radio(
                        value: 2,
                        groupValue: _radioValue1,
                        onChanged: _handleRadioValueChange1,
                      ),
                      new Text(
                        'Omnivore',
                        style: new TextStyle(fontSize: 16.0),
                      ),
                    ],
                  )
                ],
              )
            ])));
  }
}

void _showToast(BuildContext context, String value) {
  final scaffold = Scaffold.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text(value),
      action: SnackBarAction(
          label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
