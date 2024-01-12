import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:platzi_trips_app/features/home_shop/data/datasource/home_services.dart';
import 'package:platzi_trips_app/features/home_shop/domain/mapper/drawer_response_mapper.dart';
import 'package:platzi_trips_app/features/home_shop/domain/mapper/home_info_mapper.dart';
import 'package:platzi_trips_app/features/home_shop/framework/model/drawer_response.dart';
import 'package:platzi_trips_app/features/home_shop/framework/model/home_dto.dart';

class HomeServiceImpl extends HomeService {
  HomeServiceImpl();

  @override
  Future<DrawerResponse> getDrawerInfo() async {
    final String response = await rootBundle.loadString('assets/drawer_service.json');
    final data = await json.decode(response);
    await Future.delayed(const Duration(seconds: 3));
    return DrawerResponseMapper.fromJson(data);
  }

  @override
  Future<HomeDto> getHomeInfo() async {
    final String response = await rootBundle.loadString('assets/products.json');
    final data = await json.decode(response);
    await Future.delayed(const Duration(seconds: 3));
    return HomeInfoMapper.fromJson(data);
  }
}
