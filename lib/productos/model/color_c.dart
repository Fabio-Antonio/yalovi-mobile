import 'package:flutter/material.dart';

class Colores_c {
  String id = "";
  String name = "";
  String code = "";

  Colores_c(
      {Key? key, required this.id, required this.name, required this.code});

  Colores_c.fromJson(Map<String, dynamic> json) {
    id = json['uid'];
    name = json['name'];
    code = json['code'];
  }
}
