import 'dart:convert';

class UserInfo {
  final String email;
  final String? phoneNumber;
  final String id;
  final bool requirePhoneValidation;
  final bool newUser;
  final String name;


  UserInfo(
      {required this.email,
        this.phoneNumber,
        required this.id,
        required this.requirePhoneValidation,
        required this.newUser,
        required this.name
      });

  String toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['phoneNumber'] = phoneNumber;
    map['id'] = id;
    map['requirePhoneValidation'] = requirePhoneValidation;
    map['newUser'] = newUser;
    map['name'] = name;

    return jsonEncode(map);
  }

}