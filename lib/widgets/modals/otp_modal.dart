import 'package:flutter/material.dart';
import 'package:platzi_trips_app/widgets/otp_inputs.dart';

class OtpModal extends StatefulWidget {
  final void Function(String) callBack;
  final String? title;

  OtpModal({Key? key, required this.callBack, this.title}) : super(key: key);

  @override
  State<OtpModal> createState() => _OtpModalState();
}

class _OtpModalState extends State<OtpModal> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

  String _otp = "";
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        height: MediaQuery.of(context).size.height * 0.45,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(65, 15, 15, 15),
              child: Text(
                widget.title??'',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            // Implement 4 input fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OtpInputs(
                  controller: _fieldOne,
                  autoFocus: true,
                  onValueChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                ),
                OtpInputs(controller: _fieldTwo, autoFocus: false, onValueChanged: inputsActions),
                OtpInputs(controller: _fieldThree, autoFocus: false, onValueChanged: inputsActions),
                OtpInputs(
                  controller: _fieldFour,
                  autoFocus: false,
                  onValueChanged: inputsActions,
                )
              ],
            ), // Display the entered OTP code
          ],
        ));
  }

  void inputsActions(value) {
    _otp = _fieldOne.text + _fieldTwo.text + _fieldThree.text + _fieldFour.text;
    if (value.length == 1) {
      FocusScope.of(context).nextFocus();
    }
    if (_otp.length == 4) {
      widget.callBack(_otp);
    }
  }
}
