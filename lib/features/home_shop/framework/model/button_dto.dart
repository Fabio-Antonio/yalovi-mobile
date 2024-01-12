import 'dart:convert';

class ButtonDto {
  final double? height;
  final String? text;
  final double? width;
  final String? color;
  final String? screen;

  ButtonDto({this.height, this.text, this.width, this.color, this.screen});

  String toJson() {
    final map = <String, dynamic>{};
    map['height'] = height;
    map['text'] = text;
    map['width'] = width;
    map['color'] = color;
    map['screen'] = screen;

    return jsonEncode(map);
  }
}
