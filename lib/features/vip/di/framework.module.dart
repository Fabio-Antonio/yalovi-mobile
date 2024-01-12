import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/features/vip/di/domain.module.dart';
import 'package:platzi_trips_app/features/vip/framework/model/vip_response.dart';
import 'package:platzi_trips_app/features/vip/framework/presentation/viewmodel/viewmodel.dart';

final vipViewModelStateNotifierProvider = StateNotifierProvider.autoDispose<  VipViewModel, VipResponseDto?>(
      (ref) {
    return VipViewModel(ref.watch(getVipInfoUseCaseProvider));
  },
);