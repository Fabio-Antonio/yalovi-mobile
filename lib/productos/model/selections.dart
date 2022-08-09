import 'package:flutter/material.dart';

class Colores {
  String name = "";
  String code = "";

  Colores({Key? key, required this.name, required this.code});

  Colores.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
  }
}

class Sizes {
  String size = "";

  Sizes({Key? key, required this.size});

  Sizes.fromJson(Map<String, dynamic> json) {
    size = json['size'];
  }
}

class Selections {
  late List<Sizes> sizes;
  late List<Colores> colores;

  Selections.fromJson(Map<String, dynamic> json) {
    sizes = json['sizes'];
    colores = json['colors'];
  }
}
