import 'package:platzi_trips_app/splash-screen/model/configuration.dart';

class ConfigurationSingleton {
  late Configuration? configuration;
  static ConfigurationSingleton? _instance;

  ConfigurationSingleton._internal() {
    configuration=null;
  }

  static ConfigurationSingleton? get instance {
    // ignore: unnecessary_null_comparison
    if (_instance == null) {
      _instance =  ConfigurationSingleton._internal();
    }
    return _instance;
  }
}