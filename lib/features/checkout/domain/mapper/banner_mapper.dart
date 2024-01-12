import 'package:platzi_trips_app/features/checkout/framework/model/banner_dto.dart';

class BannerMapper {
  static BannerDto fromJson(Map<String, dynamic> parsedJson) {
    return BannerDto(
      title: parsedJson['title'] != null ? parsedJson['title'].toString() : "",
      text: parsedJson['text'] != null ? parsedJson['text'].toString() : "",
      bottomText: parsedJson['bottomText'] != null ? parsedJson['bottomText'].toString() : "",
      icon: parsedJson['icon'] != null ? parsedJson['icon'].toString() : "",
    );
  }
}
