import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/features/history_shop/di/domain.module.dart';
import 'package:platzi_trips_app/features/history_shop/framework/model/history_dto.dart';
import 'package:platzi_trips_app/features/history_shop/framework/presentation/viewmodel/history_viewmodel.dart';

final historyViewModelStateNotifierProvider = StateNotifierProvider.autoDispose<HistoryViewModel, HistoryDto?>(
      (ref) {
    return HistoryViewModel(ref.watch(getHistoryInfoUseCaseProvider));
  },
);