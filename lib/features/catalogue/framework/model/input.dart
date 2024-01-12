import 'dart:convert';

class InputDto {
  final double? fontSize;
  final String? textHint;
  final double? padding;

  InputDto({this.fontSize, this.textHint, this.padding});

  String toJson() {
    final map = <String, dynamic>{};
    map['fontSize'] = fontSize;
    map['textHint'] = textHint;
    map['padding'] = padding;

    return jsonEncode(map);
  }
}
