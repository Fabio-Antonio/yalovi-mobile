import 'package:flutter/material.dart';
import 'package:platzi_trips_app/features/vip/framework/model/select_sections.dart';

class Product {
  String? id;
  bool? segunda_mano;
  bool? descuento;
  String? sub_categoria;
  String? nombre_producto;
  double? precio;
  String? marca;
  String? url_imagen;
  String? priceLabel;
  final List<SelectSectionDto>? selectSections;

  Product(
      {Key? key,
      this.id,
      this.segunda_mano,
      this.descuento,
      this.sub_categoria,
      this.nombre_producto,
      this.precio,
      this.marca,
      this.url_imagen,
      this.priceLabel,
      this.selectSections});
}
