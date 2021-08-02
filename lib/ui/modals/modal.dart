import 'package:flutter/material.dart';

class ModalDialog extends StatelessWidget {
  final VoidCallback onPressed;
  String title;
  String action;

  ModalDialog(
      {Key? key,
      required this.onPressed,
      required this.title,
      required this.action});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      height: 200,
      color: Colors.amber,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(title),
            ElevatedButton(
              child: Text(action),
              onPressed: onPressed,
            )
          ],
        ),
      ),
    );
  }
}
