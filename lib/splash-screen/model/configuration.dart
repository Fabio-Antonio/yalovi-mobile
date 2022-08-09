

import 'package:flutter/material.dart';

class Configuration {
  String title= "";
  String url_image="";

  Configuration(
  {Key? key,
     required this.title,
    required  this.url_image,
});


  Configuration.fromJson(Map<String, dynamic> json) {
        title= json['title'] as String;
      url_image= json['url_image'] as String;
  }
}