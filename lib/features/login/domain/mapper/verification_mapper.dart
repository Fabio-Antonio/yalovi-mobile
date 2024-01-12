import 'package:platzi_trips_app/features/login/domain/mapper/user_mapper.dart';
import 'package:platzi_trips_app/features/login/framework/model/verification_response.dart';

class VerificationMapper {
  static VerificationResponse fromJson(Map<String, dynamic> parsedJson) {
    return VerificationResponse(
        title: parsedJson['title'],
        subTitle: parsedJson['subTitle'],
        bottomShetText: parsedJson['bottomShetText'],
        btnLabel: parsedJson['btnLabel'],
        countryCode: parsedJson['countryCode'],
        inputHint: parsedJson['inputHint'],
        user: UserInfoMapper.fromJson(parsedJson['userInfo']));
  }
}
