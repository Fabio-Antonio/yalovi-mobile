import 'dart:convert';
import 'package:platzi_trips_app/features/home_shop/framework/model/product.dart';

class SectionDto {
  final String? title;
  final String? label;
  final String? cardType;
  final String? labelAction;
  final double? height;
  final List<Product>? products;

  SectionDto({this.title, this.label, this.cardType, this.labelAction, this.products, this.height});

  String toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['label'] = label;
    map['cardType'] = cardType;
    map['labelAction'] = labelAction;
    map['products'] = products;
    map['height'] = height;

    return jsonEncode(map);
  }
}
