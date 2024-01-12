import 'package:platzi_trips_app/features/history_shop/data/repository/history_repository.dart';
import 'package:platzi_trips_app/features/history_shop/domain/usecases/get_history_info_use_case.dart';
import 'package:platzi_trips_app/features/history_shop/framework/model/history_dto.dart';

class GetHistoryInfoUseCaseImpl implements GetHistoryInfoUseCase {
  final HistoryRepository _repository;

  const GetHistoryInfoUseCaseImpl(
    this._repository,
  );

  @override
  Future<HistoryDto> invoke() async {
    final response = await _repository.getHistoryInfo();
    return response;
  }
}
