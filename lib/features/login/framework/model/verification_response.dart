import 'dart:convert';

import 'package:platzi_trips_app/features/login/framework/model/user_info.dart';

class VerificationResponse {
  final String? title;
  final String? subTitle;
  final String? bottomShetText;
  final String? countryCode;
  final String? inputHint;
  final String? btnLabel;
  final UserInfo? user;

  VerificationResponse(
      {this.title, this.subTitle, this.bottomShetText, this.countryCode, this.btnLabel, this.user, this.inputHint});

  String toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['subTitle'] = subTitle;
    map['bottomShetText'] = bottomShetText;
    map['countryCode'] = countryCode;
    map['inputHint'] = inputHint;
    map['btnLabel'] = btnLabel;
    map['user'] = user;

    return jsonEncode(map);
  }
}
