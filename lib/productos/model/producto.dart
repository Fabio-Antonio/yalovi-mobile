import 'package:flutter/material.dart';

class Producto {
  String id = "";
  bool segunda_mano = false;
  bool descuento = false;
  String sub_categoria = "";
  String nombre_producto = "";
  int precio = 0;
  String marca = "";
  String url_imagen = "";

  Producto(
      {Key? key,
      required this.id,
      required this.segunda_mano,
      required this.descuento,
      required this.sub_categoria,
      required this.nombre_producto,
      required this.precio,
      required this.marca,
      required this.url_imagen});

  Producto.fromJson(Map<String, dynamic> json) {
    id = json['uid'];
    segunda_mano = json['segunda_mano'] as bool;
    descuento = json['descuento'] as bool;
    sub_categoria = json['sub_categoria'];
    nombre_producto = json['nombre_producto'];
    precio = json['precio'] as int;
    marca = json['marca'];
    url_imagen = json['url_imagen'];
  }
}
