import '../../features/login/framework/model/user.dart';

class SecuritySingleton {
  late String tokenAccess;
  late UserAuth? user;
  static SecuritySingleton? _instance;

  SecuritySingleton._internal() {
    tokenAccess = "";
  }

  static SecuritySingleton? get instance {
    if (_instance == null) {
      _instance = SecuritySingleton._internal();
    }
    return _instance;
  }
}
