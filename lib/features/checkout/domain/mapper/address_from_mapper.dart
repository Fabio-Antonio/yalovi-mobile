import 'package:platzi_trips_app/features/checkout/framework/model/address_form.dart';

class AddressFormMapper {
  static AddressFormDto fromJson(Map<String, dynamic> parsedJson) {
    return AddressFormDto(
        title: parsedJson['titleHint'] as String,
        cityHint: parsedJson['cityHint'] as String,
        countyHint: parsedJson['countyHint'] as String,
        streetHint: parsedJson['streetHint'] as String,
        numberHint: parsedJson['numberHint'] as String,
        zipHint: parsedJson['zipHint'] as String);
  }
}

