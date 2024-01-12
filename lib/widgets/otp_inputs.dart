import 'package:flutter/material.dart';

class OtpInputs extends StatelessWidget {
  final TextEditingController? controller;
  final bool? autoFocus;
  final ValueChanged<String>? onValueChanged;

  const OtpInputs({Key? key, this.controller, this.autoFocus,this.onValueChanged,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextField(
        autofocus: autoFocus??false,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            counterText: '',
            hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
        onChanged: onValueChanged,
      ),
    );
  }
}