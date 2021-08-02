import 'dart:ffi';

import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  final IconData iconData;
  final VoidCallback onPressed;
  String tag;

  FloatingActionButtonGreen(
      {Key? key,
      required this.onPressed,
      required this.iconData,
      required this.tag});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FloatingActionButtonGreen();
  }
}

class _FloatingActionButtonGreen extends State<FloatingActionButtonGreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return FloatingActionButton(
        backgroundColor: Colors.amberAccent,
        mini: true,
        onPressed: widget.onPressed,
        child: Icon(widget.iconData),
        tooltip: "Fav",
        heroTag: widget.tag);
  }
}
