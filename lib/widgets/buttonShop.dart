import 'package:flutter/material.dart';

class buttonShop extends StatefulWidget {
  final VoidCallback onPressed;
  String tittle;

  buttonShop({Key? key, required this.tittle, required this.onPressed});

  @override
  _buttonShop createState() => _buttonShop();
}

class _buttonShop extends State<buttonShop> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialButton(
      onPressed: () => widget.onPressed,
      height: 50,
      elevation: 0,
      splashColor: Colors.yellow[700],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.yellow[800],
      child: Center(
        child: Text(
          widget.tittle,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
      ),
    );
  }
}
