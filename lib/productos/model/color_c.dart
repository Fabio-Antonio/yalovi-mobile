import 'package:flutter/material.dart';

class Colores_c {
  String id = "";
  String producto = "";
  String color = "";

  Colores_c(
      {Key? key,
      required this.id,
      required this.producto,
      required this.color});

  Colores_c.fromJson(Map<String, dynamic> json) {
    id = json['uid'];
    producto = json['producto'];
    color = json['color'];
  }
}
