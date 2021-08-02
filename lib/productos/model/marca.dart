import 'package:flutter/material.dart';

class Marca {
  String id = "";
  String marca = "";

  Marca({Key? key, required this.id, required this.marca});

  Marca.fromJson(Map<String, dynamic> json) {
    id = json['uid'];
    marca = json['marca'];
  }
}
