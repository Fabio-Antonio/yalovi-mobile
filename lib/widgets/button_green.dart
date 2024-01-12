import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class buttonGreen extends StatefulWidget {
  final VoidCallback onPressed;
  String tittle;
  final bool isLoading;
  final double? height;
  final double? width;

  buttonGreen(
      {Key? key,
      required this.onPressed,
      required this.tittle,
      required this.isLoading,
      this.height = 50,
      this.width = double.infinity});

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
        height: widget.height,
        width: widget.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
            gradient: LinearGradient(
                colors: [Color(0xFFDC935E), Color(0xFFF0B185)],
                begin: FractionalOffset(0.2, 0.0),
                end: FractionalOffset(1.0, 0.6),
                stops: [0.0, 0.6],
                tileMode: TileMode.clamp)),
        child: Center(
          child: widget.isLoading
              ? SkeletonLine(
                  style: SkeletonLineStyle(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  borderRadius: BorderRadius.circular(24),
                  width: double.infinity,
                ))
              : Text(
                  widget.tittle,
                  style: TextStyle(fontSize: 18.0, fontFamily: "Lato", color: Colors.white),
                ),
        ),
      ),
    );
  }
}
