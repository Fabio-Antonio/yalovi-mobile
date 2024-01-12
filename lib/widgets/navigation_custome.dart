import 'package:flutter/material.dart';

class NavigationCustom extends PageRouteBuilder{
  final Widget? widget;
  final bool directionRight;

  NavigationCustom({this.widget, this.directionRight = false}) : super(
      pageBuilder: (BuildContext context , Animation <double> animation, Animation<double> secondaryAnimation) {
        return widget!;
      },
      transitionsBuilder: (BuildContext context , Animation <double> animation, Animation<double> secondaryAnimation, Widget child) {
        return SlideTransition(
          position: Tween<Offset>(
              begin: Offset(directionRight ? 1.0 : -1.0 , 0.0),
              end: Offset.zero
          ).animate(animation),
          child: child,
        );
      });
}