import 'package:flutter/material.dart';
import '../../widgets/gradient_back.dart';
import '../widgets/card_image_list.dart';

class HeaderAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[GradientBack("YA' LO VI", 250.0), CardImageList()],
    );
  }
}
