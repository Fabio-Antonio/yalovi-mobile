import 'package:flutter/cupertino.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/splash-screen/model/apis/api_response.dart';
import 'package:platzi_trips_app/splash-screen/model/configuration.dart';
import 'package:platzi_trips_app/splash-screen/model/configuration_repository.dart';

import '../../singleton/configuration_singleton.dart';

class ConfigurationViewModel with ChangeNotifier {

  ApiResponse _apiResponse = ApiResponse.initial('Buscando configuraciones');

  Configuration? _configuration;

  ApiResponse get response {
    return _apiResponse;
  }

  Configuration? get configuration {
    return _configuration;
  }

  /// Call the media service and gets the data of requested media data of
  /// an artist.
  Future<void> fetchMediaData() async {
    try {
      List<Configuration> configurationList = await ConfigurationRepository().fetchMediaList();
      setConfigurationSingleton(configurationList.first);
      _apiResponse = ApiResponse.completed('Listo !!');
      notifyListeners();

    } catch (e) {
      _apiResponse = ApiResponse.error(e.toString());
      print(e);
    }
    notifyListeners();
  }

  void setConfigurationSingleton(Configuration? configuration) {

    final _configurationSingleton = ConfigurationSingleton.instance;
    _apiResponse = ApiResponse.loading('Cargando...');
    _configurationSingleton?.configuration = configuration;
    notifyListeners();
  }
}