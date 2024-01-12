import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:platzi_trips_app/features/vip/data/source/vip_service.dart';
import 'package:platzi_trips_app/features/vip/domain/mapper/vip_response_mapper.dart';
import 'package:platzi_trips_app/features/vip/framework/model/vip_response.dart';

class VipServiceImpl extends VipService {
  VipServiceImpl();

  @override
  Future<VipResponseDto> getVipInfo() async {
    try {
      final String response = await rootBundle.loadString('assets/vip_service.json');
      final data = await json.decode(response);
      await Future.delayed(const Duration(seconds: 3));
      return VipResponseMapper.fromJson(data);
    } catch (e) {
      throw e;
    }
  }
}
