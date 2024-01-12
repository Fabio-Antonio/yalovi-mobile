import 'package:platzi_trips_app/features/catalogue/data/repository/catalogue_repository.dart';
import 'package:platzi_trips_app/features/catalogue/data/source/catalogue_service.dart';
import 'package:platzi_trips_app/features/catalogue/framework/model/catalogue_response.dart';

class CatalogueRepositoryImpl implements CatalogueRepository {
  final CatalogueService _service;
  const CatalogueRepositoryImpl(this._service);

  @override
  Future<CatalogueResponseDto> getCatalogueInfo() async {
    return await _service.getCatalogueInfo();
  }
}
