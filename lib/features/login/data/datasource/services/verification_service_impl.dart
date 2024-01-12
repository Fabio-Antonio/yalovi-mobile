import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:platzi_trips_app/features/login/data/datasource/services/verification_service.dart';
import 'package:platzi_trips_app/features/login/domain/mapper/verification_mapper.dart';
import 'package:platzi_trips_app/features/login/framework/model/verification_response.dart';

class VerificationServiceImpl extends VerificationService {
  VerificationServiceImpl();

  @override
  Future<VerificationResponse> getVerificationInfo() async {
    final String response = await rootBundle.loadString('assets/otp_service.json');
    final data = await json.decode(response)['otp_data_login'];
    await Future.delayed(const Duration(seconds: 2));
    return VerificationMapper.fromJson(data);
  }
}
