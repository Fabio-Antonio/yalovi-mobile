import 'package:platzi_trips_app/features/catalogue/framework/model/catalogue_response.dart';

abstract class GetCatalogueInfoUseCase {
  Future<CatalogueResponseDto> invoke();
}