import 'package:flutter/material.dart';

class Colores {
  String id = "";
  String color = "";

  Colores({Key? key, required this.id, required this.color});

  Colores.fromJson(Map<String, dynamic> json) {
    id = json['uid'];
    color = json['color'];
  }
}
