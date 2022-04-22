import 'package:flutter/material.dart';

class user {
  final String name;
  final String email;
  final String photoURL;
  final String? phoneNumber;

  user(
      {Key? key,
      required this.name,
      required this.email,
      required this.photoURL,
      required this.phoneNumber});
}
