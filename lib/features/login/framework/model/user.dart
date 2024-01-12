import 'package:flutter/material.dart';

class UserAuth {
  final String name;
  final String email;
  final String photoURL;
  final String? phoneNumber;

  UserAuth(
      {Key? key,
      required this.name,
      required this.email,
      required this.photoURL,
      required this.phoneNumber});
}
