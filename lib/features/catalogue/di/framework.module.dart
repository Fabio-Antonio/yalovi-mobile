import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/features/catalogue/di/domain.module.dart';
import 'package:platzi_trips_app/features/catalogue/framework/model/catalogue_response.dart';
import 'package:platzi_trips_app/features/catalogue/framework/presentation/viewmodel/viewmodel.dart';

final catalogueViewModelStateNotifierProvider = StateNotifierProvider.autoDispose<CatalogueViewModel, CatalogueResponseDto?>(
  (ref) {
    return CatalogueViewModel(ref.watch(getCatalogueInfoUseCaseProvider));
  },
);
