import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:platzi_trips_app/features/history_shop/data/source/history_service.dart';
import 'package:platzi_trips_app/features/history_shop/domain/mapper/history_mapper.dart';
import 'package:platzi_trips_app/features/history_shop/framework/model/history_dto.dart';

class HistoryServiceImpl extends HistoryService {
  HistoryServiceImpl();

  @override
  Future<HistoryDto> getHistoryInfo() async {
    final String response = await rootBundle.loadString('assets/history.json');
    final data = await json.decode(response);
    await Future.delayed(const Duration(seconds: 3));
    return HistoryMapper.fromJson(data);
  }
}
