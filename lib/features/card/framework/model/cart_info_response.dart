import 'package:platzi_trips_app/features/card/framework/model/pay_info.dart';
import 'package:platzi_trips_app/features/home_shop/framework/model/button_dto.dart';
import 'package:platzi_trips_app/features/home_shop/framework/model/product.dart';
import 'package:platzi_trips_app/features/home_shop/framework/model/title_dto.dart';

class CartResponseDto {
  final TitleDto? title;
  final ButtonDto? button;
  final PayInfoDto? payInfo;
  final List<Product>? products;

  CartResponseDto({
    this.title,
    this.button,
    this.payInfo,
    this.products,
  });
}
