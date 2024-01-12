import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/features/checkout/di/data_module.dart';
import 'package:platzi_trips_app/features/checkout/domain/usecases/get_pay_info_use_case_impl.dart';
import 'package:platzi_trips_app/features/checkout/domain/usecases/get_pay_info_use_cases.dart';

final getPayInfoUseCaseProvider = Provider<GetPayInfoUseCase>((ref) =>
    GetPayInfoUseCaseImpl(ref.watch(payRepositoryProvider)));