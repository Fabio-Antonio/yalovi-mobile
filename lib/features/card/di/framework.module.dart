import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/features/card/di/domain.module.dart';
import 'package:platzi_trips_app/features/card/framework/model/cart_info_response.dart';
import 'package:platzi_trips_app/features/card/framework/presentation/viewmodel/viewmodel.dart';

final cartViewModelStateNotifierProvider = StateNotifierProvider.autoDispose<CartViewModel, CartResponseDto?>(
      (ref) {
    return CartViewModel(ref.watch(getCartInfoUseCaseProvider));
  },
);