import 'package:platzi_trips_app/features/home_shop/framework/model/product.dart';
import 'package:platzi_trips_app/features/vip/domain/mapper/select_sections_mapper.dart';

class ProductListMapper {
  static List<Product> fromJsonList(List<dynamic> json) => json.map((i) => fromJson(i)).toList();

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['uid'].toString() ?? "",
        segunda_mano: json['segunda_mano'] as bool,
        descuento: json['descuento'] as bool,
        sub_categoria: json['sub_categoria'].toString() ?? "",
        nombre_producto: json['nombre_producto'].toString() ?? "",
        precio: json['precio'] as double ?? 0,
        marca: json['marca'].toString() ?? "",
        url_imagen: json['url_imagen'].toString() ?? "",
        priceLabel: json['priceLabel'].toString() ?? "",
        selectSections: SelectSectionMapper.fromJsonList(json['selectSections'] ?? []));
  }
}
