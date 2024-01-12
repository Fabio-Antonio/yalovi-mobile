import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/features/card/di/data.module.dart';
import 'package:platzi_trips_app/features/card/domain/usecases/get_cart_info_use_case.dart';
import 'package:platzi_trips_app/features/card/domain/usecases/get_cart_info_use_case_impl.dart';

final getCartInfoUseCaseProvider = Provider<GetCartInfoUseCase>((ref) =>
    GetCartInfoUseCaseImpl(ref.watch(cartRepositoryProvider)));