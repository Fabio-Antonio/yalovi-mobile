import 'package:flutter/material.dart';

class Analytics {
  int compras = 0;
  int entregas = 0;
  int completado = 0;
  int total = 0;

  Analytics({
    Key? key,
    required this.compras,
    required this.entregas,
    required this.completado,
    required this.total,
  });

  Analytics.fromJson(Map<String, dynamic> json) {
    compras = json['compras'] as int;
    entregas = json['entregas'] as int;
    completado = json['completado'] as int;
    total = json['total'] as int;
  }
}
