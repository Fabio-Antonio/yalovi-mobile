import 'package:platzi_trips_app/features/catalogue/data/repository/catalogue_repository.dart';
import 'package:platzi_trips_app/features/catalogue/domain/usecases/get_catalogue_info_usecase.dart';
import 'package:platzi_trips_app/features/catalogue/framework/model/catalogue_response.dart';

class GetCatalogueInfoUseCaseImpl implements GetCatalogueInfoUseCase {
  final CatalogueRepository _repository;

  const GetCatalogueInfoUseCaseImpl(
      this._repository,
      );

  @override
  Future<CatalogueResponseDto> invoke() async {
    final response = await _repository.getCatalogueInfo();
    return response;
  }
}