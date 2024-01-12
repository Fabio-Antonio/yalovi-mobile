import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/core/modeling/dto/error_ui.dart';
import 'package:platzi_trips_app/core/singleton/security_singleton.dart';
import 'package:platzi_trips_app/features/card/domain/usecases/get_cart_info_use_case.dart';
import 'package:platzi_trips_app/features/card/framework/model/cart_info_response.dart';

class CartViewModel extends StateNotifier<CartResponseDto?> {
  final GetCartInfoUseCase _getCartInfoUseCase;
  final _securitySingleton = SecuritySingleton.instance;

  CartViewModel(this._getCartInfoUseCase, [CartResponseDto? cart]) : super(cart);

  final StreamController<ErrorUi> _showModalError = StreamController<ErrorUi>.broadcast();

  Stream get showModalError => _showModalError.stream;

  final StreamController<bool> _isLoading = StreamController<bool>.broadcast();

  Stream get isLoading => _isLoading.stream;

  final StreamController<CartResponseDto?> _cartInfo = StreamController<CartResponseDto?>.broadcast();

  Stream get cartInfo => _cartInfo.stream;

  getCartInfo() async {
    _isLoading.add(true);
    await _getCartInfoUseCase.invoke().then((response) {
      _cartInfo.sink.add(response);
      state = response;
      _isLoading.add(false);
    }).onError((error, stackTrace) {
      _isLoading.add(false);
      _showModalError.add(ErrorUi(title: "Aviso!!", message: error.toString()));
    });
  }
}