import 'package:platzi_trips_app/features/checkout/framework/model/address_dto.dart';
import 'package:platzi_trips_app/features/checkout/framework/model/address_form.dart';
import 'package:platzi_trips_app/features/checkout/framework/model/card_form_dto.dart';
import 'package:platzi_trips_app/features/checkout/framework/model/payment_methods_dto.dart';
import 'package:platzi_trips_app/features/home_shop/framework/model/button_dto.dart';
import 'package:platzi_trips_app/features/home_shop/framework/model/title_dto.dart';

class PayResponseDto {
  final TitleDto? title;
  final ButtonDto? button;
  final PaymentMethodsDto? paymentMethods;
  final CardFormDto? cardForm;
  final AddressFormDto? addressForm;
  final AddressDto? address;

  PayResponseDto({this.title, this.button, this.paymentMethods, this.cardForm, this.addressForm, this.address});
}
