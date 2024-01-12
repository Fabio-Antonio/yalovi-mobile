import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/core/modeling/dto/error_ui.dart';
import 'package:platzi_trips_app/core/singleton/security_singleton.dart';
import 'package:platzi_trips_app/features/vip/domain/usecases/get_vip_info_usecase.dart';
import 'package:platzi_trips_app/features/vip/framework/model/vip_response.dart';

class VipViewModel extends StateNotifier<VipResponseDto?> {
  final GetVipInfoUseCase _getVipInfoUseCase;
  final _securitySingleton = SecuritySingleton.instance;

  VipViewModel(this._getVipInfoUseCase, [VipResponseDto? cart]) : super(cart);

  final StreamController<ErrorUi> _showModalError = StreamController<ErrorUi>.broadcast();

  Stream get showModalError => _showModalError.stream;

  final StreamController<bool> _isLoading = StreamController<bool>.broadcast();

  Stream get isLoading => _isLoading.stream;

  final StreamController<VipResponseDto?> _vipInfo = StreamController<VipResponseDto?>.broadcast();

  Stream get vipInfo => _vipInfo.stream;

  getVipInfo() async {
    _isLoading.add(true);
    await _getVipInfoUseCase.invoke().then((response) {
      _vipInfo.sink.add(response);
      state = response;
      _isLoading.add(false);
    }).onError((error, stackTrace) {
      _isLoading.add(false);
      _showModalError.add(ErrorUi(title: "Aviso!!", message: error.toString()));
    });
  }
}
