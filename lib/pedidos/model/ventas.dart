import 'package:flutter/material.dart';

class Ventas {
  String id = "";
  String nombre = "";
  String apellidos = "";
  String email = "";
  String direccion = "";
  String referencias = "";
  String telefono = "";
  String pais = "";
  String estado = "";
  String postal = "";
  String forma_pago = "";
  String nombre_tarjeta = "";
  String token = "";
  String fecha = "";
  int total = 0;
  String status = "";
  bool terminos = false;

  Ventas(
      {Key? key,
      required this.id,
      required this.nombre,
      required this.apellidos,
      required this.email,
      required this.direccion,
      required this.referencias,
      required this.telefono,
      required this.pais,
      required this.estado,
      required this.postal,
      required this.forma_pago,
      required this.nombre_tarjeta,
      required this.token,
      required this.fecha,
      required this.total,
      required this.status,
      required this.terminos});

  Ventas.fromJson(Map<String, dynamic> json) {
    id = json['uid'];
    nombre = json['nombre'];
    apellidos = json['apellidos'];
    email = json['email'];
    direccion = json['direccion'];
    referencias = json['referencias'];
    telefono = json['telefono'];
    pais = json['pais'];
    estado = json['estado'];
    postal = json['postal'];
    forma_pago = json['forma_pago'];
    nombre_tarjeta = json['nombre_tarjeta'];
    token = json['token'];
    fecha = json['fecha'];
    total = json['total'] as int;
    status = json['status'];
    terminos = json['terminos'] as bool;
  }
}
