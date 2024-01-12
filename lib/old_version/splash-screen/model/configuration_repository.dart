

import 'package:platzi_trips_app/splash-screen/model/configuration.dart';
import 'package:platzi_trips_app/splash-screen/model/services/base_service.dart';
import 'package:platzi_trips_app/splash-screen/model/services/configuration_service.dart';

class ConfigurationRepository {
  BaseService _configurationService = ConfigurationService();

  Future<List<Configuration>> fetchMediaList() async {
    dynamic response = await _configurationService.getConfiguration();
    final List<dynamic> responseJson = response["configuration"] as List;
    return responseJson.map((e) => Configuration.fromJson(e)).toList();
  }
}