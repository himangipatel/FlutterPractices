import 'package:flutter/material.dart';

class GradientButton extends StatefulWidget {
  final List<Color> colors;
  final Key key;
  final VoidCallback onPressed;
  final String buttonLabel;

  const GradientButton({this.key, this.colors,this.onPressed,this.buttonLabel});

  @override
  _GradientButtonState createState() => _GradientButtonState();
}

class _GradientButtonState extends State<GradientButton> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: SizedBox(
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: widget.colors,
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(0.5, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
            borderRadius: BorderRadius.circular(12.0),
          ),
          margin: EdgeInsets.fromLTRB(35, 50, 35, 0),
          child: RaisedButton(
            key: widget.key,
            color: Colors.white10,
            padding: EdgeInsets.all(15),
            child: Text(
              widget.buttonLabel.toUpperCase(),
              style: TextStyle(color: Colors.white),
            ),
            onPressed: widget.onPressed,
          ),
        ),
      ),
    );
  }
}
