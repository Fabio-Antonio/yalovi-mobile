import 'package:platzi_trips_app/features/checkout/framework/model/address_dto.dart';

class AddressMapper {
  static AddressDto fromJson(Map<String, dynamic> parsedJson) {
    return AddressDto(
        title: parsedJson['title'] != null ? parsedJson['title'].toString() : "",
        city: parsedJson['city'] != null ? parsedJson['city'].toString() : "",
        county: parsedJson['county'] != null ? parsedJson['county'].toString() : "",
        street: parsedJson['street'] != null ? parsedJson['street'].toString() : "",
        number: parsedJson['number'] != null ? parsedJson['number'].toString() : "",
        zip: parsedJson['zip'] != null ? parsedJson['zip'].toString() : "");
  }
}
