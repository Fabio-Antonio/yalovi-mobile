import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:platzi_trips_app/features/catalogue/data/source/catalogue_service.dart';
import 'package:platzi_trips_app/features/catalogue/domain/mapper/catalogue_response_mapper.dart';
import 'package:platzi_trips_app/features/catalogue/framework/model/catalogue_response.dart';

class CatalogueServiceImpl extends CatalogueService {
  CatalogueServiceImpl();

  @override
  Future<CatalogueResponseDto> getCatalogueInfo() async {
    try {
      final String response = await rootBundle.loadString('assets/catalogue.json');
      final data = await json.decode(response);
      await Future.delayed(const Duration(seconds: 3));
      return CatalogueResponseMapper.fromJson(data);
    } catch (e) {
      print(e);
      return CatalogueResponseDto();
    }
  }
}
