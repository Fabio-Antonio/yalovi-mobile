import 'package:flutter/material.dart';

class buttonGreen extends StatefulWidget {
  final VoidCallback onPressed;
  String tittle;

  buttonGreen({Key? key, required this.onPressed, required this.tittle});

  @override
  _buttonGreen createState() => _buttonGreen();
}

class _buttonGreen extends State<buttonGreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
        height: 50.0,
        width: 180.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
                colors: [Colors.amber, Colors.amberAccent],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp)),
        child: Center(
          child: Text(
            widget.tittle,
            style: TextStyle(
                fontSize: 18.0, fontFamily: "Lato", color: Colors.white),
          ),
        ),
      ),
    );
  }
}
