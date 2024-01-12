import 'package:platzi_trips_app/features/checkout/framework/model/card_form_dto.dart';

class CardFormMapper {
  static CardFormDto fromJson(Map<String, dynamic> parsedJson) {
    return CardFormDto(
      title: parsedJson['title'] as String,
      nameHint: parsedJson['nameHint'] as String,
      cardNumberHint: parsedJson['cardNumberHint'] as String,
      monthHint: parsedJson['monthHint'] as String,
      yearHint: parsedJson['yearHint'] as String,
      securityHint: parsedJson['securityHint'] as String,
    );
  }
}
