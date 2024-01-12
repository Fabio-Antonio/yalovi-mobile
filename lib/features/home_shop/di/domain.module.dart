import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/features/home_shop/di/data.module.dart';
import 'package:platzi_trips_app/features/home_shop/domain/usecases/get_drawer_info_use_case.dart';
import 'package:platzi_trips_app/features/home_shop/domain/usecases/get_drawer_info_use_case_impl.dart';
import 'package:platzi_trips_app/features/home_shop/domain/usecases/get_home_info_use_case.dart';
import 'package:platzi_trips_app/features/home_shop/domain/usecases/get_home_info_use_case_impl.dart';

final getDrawerInfoUseCaseProvider = Provider<GetDrawerInfoUseCase>((ref) =>
    GetDrawerInfoUseCaseImpl(ref.watch(homeRepositoryProvider)));
final getHomeInfoUseCaseProvider = Provider<GetHomeInfoUseCase>((ref) =>
    GetHomeInfoUseCaseImpl(ref.watch(homeRepositoryProvider)));