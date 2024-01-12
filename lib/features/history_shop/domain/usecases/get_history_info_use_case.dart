import 'package:platzi_trips_app/features/history_shop/framework/model/history_dto.dart';

abstract class GetHistoryInfoUseCase {
  Future<HistoryDto> invoke();
}