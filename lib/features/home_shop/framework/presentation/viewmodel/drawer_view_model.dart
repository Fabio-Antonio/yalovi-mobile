import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/core/modeling/dto/error_ui.dart';
import 'package:platzi_trips_app/features/home_shop/domain/usecases/get_drawer_info_use_case.dart';
import 'package:platzi_trips_app/features/home_shop/domain/usecases/get_home_info_use_case.dart';
import 'package:platzi_trips_app/features/home_shop/framework/model/drawer_info_dto.dart';
import 'package:platzi_trips_app/core/singleton/security_singleton.dart';
import 'package:platzi_trips_app/features/home_shop/framework/model/home_dto.dart';

class DrawerViewModel extends StateNotifier<DrawerInfoDto?> {
  final GetDrawerInfoUseCase _drawerInfoUseCase;
  final GetHomeInfoUseCase _getHomeInfoUseCase;
  final _securitySingleton = SecuritySingleton.instance;

  DrawerViewModel(this._drawerInfoUseCase, this._getHomeInfoUseCase, [DrawerInfoDto? drawer]) : super(drawer);

  final StreamController<ErrorUi> _showModalError = StreamController<ErrorUi>.broadcast();

  Stream get showModalError => _showModalError.stream;

  final StreamController<bool> _isLoading = StreamController<bool>.broadcast();

  Stream get isLoading => _isLoading.stream;

  final StreamController<bool> _isLoadingHome = StreamController<bool>.broadcast();

  Stream get isLoadingHome => _isLoadingHome.stream;

  final StreamController<bool> _isScrolled = StreamController<bool>.broadcast();

  Stream get isScrolled => _isScrolled.stream;

  final StreamController<int> _tappedIndex = StreamController<int>.broadcast();

  Stream get tappedIndex => _tappedIndex.stream;

  final StreamController<DrawerInfoDto> _drawerInfo = StreamController<DrawerInfoDto>.broadcast();

  Stream get drawerInfo => _drawerInfo.stream;

  final StreamController<HomeDto> _productsList = StreamController<HomeDto>.broadcast();

  Stream get productsList => _productsList.stream;

  getDrawerInfo() async {
    _isLoading.add(true);
    await _drawerInfoUseCase.invoke().then((response) {
      var info = DrawerInfoDto(options: response.options, userAuth: _securitySingleton?.user);
      _drawerInfo.sink.add(info);
      state = info;
      _isLoading.add(false);
    }).onError((error, stackTrace) {
      _isLoading.add(false);
      _showModalError.add(ErrorUi(title: "Aviso!!", message: error.toString()));
    });
  }

  onTapped(int index) {
    _tappedIndex.add(index);
  }

  listenToScrollChangeFlag(bool flag) {
    _isScrolled.add(flag);
  }

  getProducts() async {
    _isLoadingHome.add(true);
    await _getHomeInfoUseCase.invoke().then((response) async {
      _productsList.sink.add(response);
      _isLoadingHome.add(false);
    }).onError((error, stackTrace) {
      print(stackTrace);
      _isLoadingHome.add(false);
      _showModalError.add(ErrorUi(title: "Aviso!!", message: error.toString()));
    });
  }
}
