import 'package:flutter/material.dart';

Widget LoadingOverlayAlt({required bool status, String? text}) {
  return Visibility(
      visible: status,
      child: Stack(
        children: [
          const Opacity(
            opacity: 0.8,
            child: ModalBarrier(dismissible: false, color: Colors.black),
          ),
          const Center(
            child: CircularProgressIndicator(),
          ),
        ],
      ));
}
