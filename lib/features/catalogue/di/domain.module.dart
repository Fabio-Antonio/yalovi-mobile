import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/features/catalogue/di/data.module.dart';
import 'package:platzi_trips_app/features/catalogue/domain/usecases/get_catalogue_info_usecase.dart';
import 'package:platzi_trips_app/features/catalogue/domain/usecases/get_catalogue_usecase_impl.dart';

final getCatalogueInfoUseCaseProvider =
    Provider<GetCatalogueInfoUseCase>((ref) => GetCatalogueInfoUseCaseImpl(ref.watch(catalogueRepositoryProvider)));
