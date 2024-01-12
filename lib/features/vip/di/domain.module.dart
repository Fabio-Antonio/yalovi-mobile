import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/features/vip/di/data.module.dart';
import 'package:platzi_trips_app/features/vip/domain/usecases/get_vip_info_use_case_impl.dart';
import 'package:platzi_trips_app/features/vip/domain/usecases/get_vip_info_usecase.dart';

final getVipInfoUseCaseProvider = Provider<GetVipInfoUseCase>((ref) =>
    GetVipInfoUseCaseImpl(ref.watch(vipRepositoryProvider)));