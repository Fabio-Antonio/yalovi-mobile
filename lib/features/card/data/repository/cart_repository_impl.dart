import 'package:platzi_trips_app/features/card/data/repository/cart_repository.dart';
import 'package:platzi_trips_app/features/card/data/source/cart_service.dart';
import 'package:platzi_trips_app/features/card/framework/model/cart_info_response.dart';

class CartRepositoryImpl implements CartRepository {
  final CartService _service;
  const CartRepositoryImpl(this._service);

  @override
  Future<CartResponseDto> getCartInfo() async {
    return await _service.getCartInfo();
  }
}