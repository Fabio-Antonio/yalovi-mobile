class securitySingleton {
  late String tokenAccess;
  static securitySingleton? _instance;

  securitySingleton._internal() {
    tokenAccess = "prueba";
  }

  static securitySingleton? get instance {
    // ignore: unnecessary_null_comparison
    if (_instance == null) {
      _instance = securitySingleton._internal();
    }
    return _instance;
  }
}
