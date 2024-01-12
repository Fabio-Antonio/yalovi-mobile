import 'package:platzi_trips_app/features/catalogue/framework/model/catalogue_response.dart';

abstract class CatalogueService {
  Future<CatalogueResponseDto> getCatalogueInfo();
}