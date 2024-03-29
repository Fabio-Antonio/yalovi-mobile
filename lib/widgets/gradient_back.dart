import 'package:flutter/material.dart';

class GradientBack extends StatelessWidget {
  String title = "";
  double height = 0.0;

  GradientBack(this.title, this.height);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [ Color(0xFFF6E2CA),Color(0xFFE5CDB3)],
              begin: FractionalOffset(0.3, 0.0),
              end: FractionalOffset(1.0, 0.6),
              stops: [0.0, 0.6],
              tileMode: TileMode.clamp)),
      child: Text(
        title,
        style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontFamily: "Lato",
            fontWeight: FontWeight.bold),
      ),
      alignment: Alignment(-0.9, -0.6),
    );
  }
}
