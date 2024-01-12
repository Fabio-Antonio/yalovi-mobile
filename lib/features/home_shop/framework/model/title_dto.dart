import 'dart:convert';

class TitleDto{
  final double? fontSize;
  final String? text;
  final double? padding;

  TitleDto(
      {this.fontSize, this.text, this.padding});

  String toJson() {
    final map = <String, dynamic>{};
    map['fontSize'] = fontSize;
    map['text'] = text;
    map['padding'] = padding;

    return jsonEncode(map);
  }
}