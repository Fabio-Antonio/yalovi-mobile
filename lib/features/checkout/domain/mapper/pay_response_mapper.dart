import 'package:platzi_trips_app/features/checkout/domain/mapper/address_from_mapper.dart';
import 'package:platzi_trips_app/features/checkout/domain/mapper/adress_mapper.dart';
import 'package:platzi_trips_app/features/checkout/domain/mapper/card_form_mapper.dart';
import 'package:platzi_trips_app/features/checkout/domain/mapper/pay_methods_mapper.dart';
import 'package:platzi_trips_app/features/checkout/framework/model/pay_response_dto.dart';
import 'package:platzi_trips_app/features/home_shop/domain/mapper/button_mapper.dart';
import 'package:platzi_trips_app/features/home_shop/domain/mapper/title_mapper.dart';

class PayResponseMapper {
  static PayResponseDto fromJson(Map<String, dynamic> json) {
    return PayResponseDto(
        title: TitleMapper.fromJson(json["title"]),
        button: ButtonMapper.fromJson(json["button"]),
        paymentMethods: PayMethodsMapper.fromJson(json['paymentMethods']),
        cardForm: CardFormMapper.fromJson(json['cardForm']),
        addressForm: AddressFormMapper.fromJson(json['addressForm']),
        address: AddressMapper.fromJson(json['address']));
  }
}
