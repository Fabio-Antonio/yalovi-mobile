import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:platzi_trips_app/features/card/data/source/cart_service.dart';
import 'package:platzi_trips_app/features/card/domain/mapper/cart_response_mapper.dart';
import 'package:platzi_trips_app/features/card/framework/model/cart_info_response.dart';

class CartServiceImpl extends CartService {
  CartServiceImpl();

  @override
  Future<CartResponseDto> getCartInfo() async {
    try{
      final String response = await rootBundle.loadString('assets/cart_service.json');
      final data = await json.decode(response);
      await Future.delayed(const Duration(seconds: 3));
      return CartResponseMapper.fromJson(data);
    }catch(e){
      print(e);
      return CartResponseDto();
    }

  }
}
