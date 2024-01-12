import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/features/checkout/di/domain_module.dart';
import 'package:platzi_trips_app/features/checkout/framework/model/pay_response_dto.dart';
import 'package:platzi_trips_app/features/checkout/framework/presentation/viewmodel/viewmodel.dart';

final payViewModelStateNotifierProvider = StateNotifierProvider.autoDispose<PayViewModel, PayResponseDto?>(
      (ref) {
    return PayViewModel(ref.watch(getPayInfoUseCaseProvider));
  },
);