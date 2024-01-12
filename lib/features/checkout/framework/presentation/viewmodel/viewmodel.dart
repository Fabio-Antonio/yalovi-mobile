import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/core/modeling/dto/error_ui.dart';
import 'package:platzi_trips_app/core/singleton/security_singleton.dart';
import 'package:platzi_trips_app/features/checkout/domain/usecases/get_pay_info_use_case_impl.dart';
import 'package:platzi_trips_app/features/checkout/framework/model/method_dto.dart';
import 'package:platzi_trips_app/features/checkout/framework/model/pay_response_dto.dart';

class PayViewModel extends StateNotifier<PayResponseDto?> {
  final GetPayInfoUseCase _getPayInfoUseCase;
  final _securitySingleton = SecuritySingleton.instance;

  PayViewModel(this._getPayInfoUseCase, [PayResponseDto? cart]) : super(cart);

  final StreamController<ErrorUi> _showModalError = StreamController<ErrorUi>.broadcast();

  Stream get showModalError => _showModalError.stream;

  final StreamController<bool> _isLoading = StreamController<bool>.broadcast();

  Stream get isLoading => _isLoading.stream;

  final StreamController<PayResponseDto?> _payInfo = StreamController<PayResponseDto?>.broadcast();

  Stream get payInfo => _payInfo.stream;

  getPayInfo() async {
    _isLoading.add(true);
    await _getPayInfoUseCase.invoke().then((response) {
      state = response;
      this.setSelected(0);
      _isLoading.add(false);
    }).onError((error, stackTrace) {
      _isLoading.add(false);
      _showModalError.add(ErrorUi(title: "Aviso!!", message: error.toString()));
    });
  }

  setSelected(int index) {
    var methods = state;
    methods?.paymentMethods?.methods?.asMap().forEach(((idx, element) {
      if (index == idx) {
        element.isSelected = true;
      } else {
        element.isSelected = false;
      }
    }));
    _payInfo.sink.add(methods);
  }
}
