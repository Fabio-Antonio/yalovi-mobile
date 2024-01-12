import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/features/home_shop/di/domain.module.dart';
import 'package:platzi_trips_app/features/home_shop/framework/model/drawer_info_dto.dart';
import 'package:platzi_trips_app/features/home_shop/framework/presentation/viewmodel/drawer_view_model.dart';

final drawerViewModelStateNotifierProvider = StateNotifierProvider.autoDispose<DrawerViewModel, DrawerInfoDto?>(
  (ref) {
    return DrawerViewModel(ref.watch(getDrawerInfoUseCaseProvider), ref.watch(getHomeInfoUseCaseProvider));
  },
);
