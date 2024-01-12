import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/core/modeling/dto/error_ui.dart';
import 'package:platzi_trips_app/core/singleton/security_singleton.dart';
import 'package:platzi_trips_app/features/history_shop/domain/usecases/get_history_info_use_case.dart';
import 'package:platzi_trips_app/features/history_shop/framework/model/history_dto.dart';

class HistoryViewModel extends StateNotifier<HistoryDto?> {
  final GetHistoryInfoUseCase _getHistoryInfoUseCase;
  final _securitySingleton = SecuritySingleton.instance;

  HistoryViewModel(this._getHistoryInfoUseCase, [HistoryDto? history]) : super(history);

  final StreamController<ErrorUi> _showModalError = StreamController<ErrorUi>.broadcast();

  Stream get showModalError => _showModalError.stream;

  final StreamController<bool> _isLoading = StreamController<bool>.broadcast();

  Stream get isLoading => _isLoading.stream;

  final StreamController<HistoryDto> _historyInfo = StreamController<HistoryDto>.broadcast();

  Stream get historyInfo => _historyInfo.stream;

  getHistoryInfo() async {
    _isLoading.add(true);
    await _getHistoryInfoUseCase.invoke().then((response) {
      _historyInfo.sink.add(response);
      state = response;
      _isLoading.add(false);
    }).onError((error, stackTrace) {
      _isLoading.add(false);
      _showModalError.add(ErrorUi(title: "Aviso!!", message: error.toString()));
    });
  }
}
