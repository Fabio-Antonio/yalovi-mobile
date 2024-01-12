import 'package:platzi_trips_app/features/login/framework/model/user_info.dart';

class UserInfoMapper {
  static UserInfo fromJson(Map<String, dynamic> parsedJson) {
    return UserInfo(
        email: parsedJson['email'] as String,
        phoneNumber: parsedJson['phoneNumber'] as String,
        id: parsedJson['id'] as String,
        requirePhoneValidation: parsedJson['requirePhoneValidation'] as bool,
        newUser: parsedJson['newUser'] as bool,
        name: parsedJson['name'] as String);
  }
}
