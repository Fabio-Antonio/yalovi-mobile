import 'package:flutter/material.dart';

class Sub_categoria {
  String id = "";
  String categoria = "";
  String sub_categoria = "";

  Sub_categoria(
      {Key? key,
      required this.id,
      required this.categoria,
      required this.sub_categoria});

  Sub_categoria.fromJson(Map<String, dynamic> json) {
    id = json['uid'];
    categoria = json['categoria'];
    sub_categoria = json['sub_categoria'];
  }
}
