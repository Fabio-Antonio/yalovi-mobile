import 'package:platzi_trips_app/features/history_shop/data/repository/history_repository.dart';
import 'package:platzi_trips_app/features/history_shop/data/source/history_service.dart';
import 'package:platzi_trips_app/features/history_shop/framework/model/history_dto.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  final HistoryService _service;
  const HistoryRepositoryImpl(this._service);

  @override
  Future<HistoryDto> getHistoryInfo() async {
    return await _service.getHistoryInfo();
  }
}
