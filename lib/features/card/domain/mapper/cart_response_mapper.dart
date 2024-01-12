import 'package:platzi_trips_app/features/card/domain/mapper/pay_info_mapper.dart';
import 'package:platzi_trips_app/features/card/framework/model/cart_info_response.dart';
import 'package:platzi_trips_app/features/home_shop/domain/mapper/button_mapper.dart';
import 'package:platzi_trips_app/features/home_shop/domain/mapper/product_list_mapper.ts.dart';
import 'package:platzi_trips_app/features/home_shop/domain/mapper/title_mapper.dart';

class CartResponseMapper {
  static CartResponseDto fromJson(Map<String, dynamic> json) {
    return CartResponseDto(
      title: TitleMapper.fromJson(json["title"]),
      button: ButtonMapper.fromJson(json["button"]),
      payInfo: PayInfoMapper.fromJson(json['payInfo']),
      products: ProductListMapper.fromJsonList(json['products']),
    );
  }
}