import 'dart:convert';

class RequestVerification {
  final String email;
  final String? phoneNumber;
  final String uid;

  RequestVerification(
      {required this.email,
         this.phoneNumber,
         required this.uid
        });

  String toJson() {
    final map = <String, dynamic>{};
    map['email'] = email;
    map['phoneNumber'] = phoneNumber;
    map['firebaseId'] = uid;

    return jsonEncode(map);
  }

}