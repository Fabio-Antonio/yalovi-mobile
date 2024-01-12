import 'package:flutter/material.dart';
import 'package:platzi_trips_app/features/home_shop/framework/model/button_dto.dart';
import 'package:platzi_trips_app/features/home_shop/framework/model/section_dto.dart';
import 'package:platzi_trips_app/features/home_shop/framework/model/title_dto.dart';

class HomeDto {
  String? imgUrl;
  TitleDto? title;
  ButtonDto? button;
  List<SectionDto>? sections;

  HomeDto({
    Key? key,
    this.imgUrl,
    this.title,
    this.button,
    this.sections,
  });
}
