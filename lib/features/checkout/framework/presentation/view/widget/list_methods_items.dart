import 'package:flutter/material.dart';

Widget listMethodItemWidget({required bool isSelected, required VoidCallback onTap, required String icon}) {
  return GestureDetector(
    onTap: onTap,
    child: AnimatedContainer(
      duration: Duration(milliseconds: 300),
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        border: isSelected == true
            ? Border.all(color: Colors.grey.shade300, width: 1)
            : Border.all(color: Colors.grey.shade300.withOpacity(0), width: 1),
      ),
      child: Image.network(
        icon,
        height: 50,
      ),
    ),
  );
}
