import 'package:platzi_trips_app/features/home_shop/data/repository/home_repository.dart';
import 'package:platzi_trips_app/features/home_shop/domain/usecases/get_home_info_use_case.dart';
import 'package:platzi_trips_app/features/home_shop/framework/model/home_dto.dart';

class GetHomeInfoUseCaseImpl implements GetHomeInfoUseCase {
  final HomeRepository _repository;

  const GetHomeInfoUseCaseImpl(
    this._repository,
  );

  @override
  Future<HomeDto> invoke() async {
    final response = await _repository.getHomeInfo();
    return response;
  }
}
