import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/core/modeling/dto/error_ui.dart';
import 'package:platzi_trips_app/core/singleton/security_singleton.dart';
import 'package:platzi_trips_app/features/catalogue/domain/usecases/get_catalogue_info_usecase.dart';
import 'package:platzi_trips_app/features/catalogue/framework/model/catalogue_response.dart';

class CatalogueViewModel extends StateNotifier<CatalogueResponseDto?> {
  final GetCatalogueInfoUseCase _getCatalogueInfoUseCase;
  final _securitySingleton = SecuritySingleton.instance;

  CatalogueViewModel(this._getCatalogueInfoUseCase, [CatalogueResponseDto? catalogue]) : super(catalogue);

  final StreamController<ErrorUi> _showModalError = StreamController<ErrorUi>.broadcast();

  Stream get showModalError => _showModalError.stream;

  final StreamController<bool> _isLoading = StreamController<bool>.broadcast();

  Stream get isLoading => _isLoading.stream;

  final StreamController<CatalogueResponseDto?> _catalogueInfo = StreamController<CatalogueResponseDto?>.broadcast();

  Stream get catalogueInfo => _catalogueInfo.stream;

  getCatalogueInfo() async {
    _isLoading.add(true);
    await _getCatalogueInfoUseCase.invoke().then((response) {
      _catalogueInfo.sink.add(response);
      state = response;
      _isLoading.add(false);
    }).onError((error, stackTrace) {
      _isLoading.add(false);
      _showModalError.add(ErrorUi(title: "Aviso!!", message: error.toString()));
    });
  }
}
