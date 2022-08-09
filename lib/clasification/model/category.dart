import 'package:flutter/material.dart';

class Category {
  String id = "";
  String categoria = "";
  String descripcion = "";

  Category(
      {Key? key,
      required this.id,
      required this.categoria,
      required this.descripcion});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['uid'];
    categoria = json['categoria'];
    descripcion = json['descripcion'];
  }
}
