import 'package:flutter/material.dart';

class Pedidos {
  String id = "";
  String url_imagen = "";
  String talla = "";
  int cantidad = 0;
  String color = "";
  String nombre_producto = "";
  int precio = 0;
  String marca = "";
  String token = "";

  Pedidos(
      {Key? key,
      required this.id,
      required this.url_imagen,
      required this.talla,
      required this.cantidad,
      required this.color,
      required this.nombre_producto,
      required this.precio,
      required this.marca,
      required this.token});

  Pedidos.fromJson(Map<String, dynamic> json) {
    id = json['uid'];
    url_imagen = json['url_imagen'];
    talla = json['tallas'];
    cantidad = json['cantidad'] as int;
    color = json['color'];
    nombre_producto = json['nombre_producto'];
    precio = json['precio'] as int;
    marca = json['marca'];
    token = json['token'];
  }
}
