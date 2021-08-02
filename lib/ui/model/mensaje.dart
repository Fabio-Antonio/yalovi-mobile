import 'package:flutter/material.dart';

class Mensaje {
  final String nombre;
  final String email;
  final String mensaje;

  Mensaje(
      {Key? key,
      required this.nombre,
      required this.email,
      required this.mensaje});
}
