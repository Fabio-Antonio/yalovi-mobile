import 'package:flutter/material.dart';
import 'package:platzi_trips_app/modals/widgets/otp_inputs.dart';

class OtpModal extends StatefulWidget {
  OtpModal({Key? key}) : super(key: key);

  @override
  State<OtpModal> createState() => _OtpModalState();
}

class _OtpModalState extends State<OtpModal> {
  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();
  String? _otp;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
        height: MediaQuery.of(context).size.height * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Phone Number Verification'),
            const SizedBox(
              height: 30,
            ),
            // Implement 4 input fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OtpInputs(_fieldOne, true),
                OtpInputs(_fieldTwo, false),
                OtpInputs(_fieldThree, false),
                OtpInputs(_fieldFour, false)
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _otp = _fieldOne.text +
                        _fieldTwo.text +
                        _fieldThree.text +
                        _fieldFour.text;
                  });
                },
                child: const Text('Submit')),
            const SizedBox(
              height: 30,
            ),
            // Display the entered OTP code
            Text(
              _otp ?? 'Please enter OTP',
              style: const TextStyle(fontSize: 30),
            )
          ],
        ));
  }
}
