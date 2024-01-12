import 'package:platzi_trips_app/features/card/framework/model/cart_info_response.dart';

abstract class CartService {
  Future<CartResponseDto> getCartInfo();
}