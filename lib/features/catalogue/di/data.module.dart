
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/features/catalogue/data/repository/catalogue_repository.dart';
import 'package:platzi_trips_app/features/catalogue/data/repository/catalogue_repository_impl.dart';
import 'package:platzi_trips_app/features/catalogue/data/source/catalogue_service.dart';
import 'package:platzi_trips_app/features/catalogue/data/source/catalogue_service_impl.ts.dart';

final catalogueApiProvider = Provider<CatalogueService>((_) => CatalogueServiceImpl());
final catalogueRepositoryProvider =
Provider<CatalogueRepository>((ref) => CatalogueRepositoryImpl(ref.watch(catalogueApiProvider)));