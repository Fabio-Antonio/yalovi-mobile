import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:platzi_trips_app/features/checkout/data/datasource/pay_service.dart';
import 'package:platzi_trips_app/features/checkout/domain/mapper/pay_response_mapper.dart';
import 'package:platzi_trips_app/features/checkout/framework/model/pay_response_dto.dart';

class PayServiceImpl extends PayService {
  PayServiceImpl();

  @override
  Future<PayResponseDto> getPayInfo() async {
    try{
      final String response = await rootBundle.loadString('assets/pay_service.json');
      final data = await json.decode(response);
      await Future.delayed(const Duration(seconds: 3));
      return PayResponseMapper.fromJson(data);
    }catch(e){
      print(e);
      return PayResponseDto();
    }

  }
}