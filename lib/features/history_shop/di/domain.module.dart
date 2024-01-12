import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/features/history_shop/di/data.module.dart';
import 'package:platzi_trips_app/features/history_shop/domain/usecases/get_history_info_use_case.dart';
import 'package:platzi_trips_app/features/history_shop/domain/usecases/get_history_info_use_case_impl.dart';

final getHistoryInfoUseCaseProvider = Provider<GetHistoryInfoUseCase>((ref) =>
    GetHistoryInfoUseCaseImpl(ref.watch(historyRepositoryProvider)));
