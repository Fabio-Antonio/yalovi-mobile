import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

Widget cartView() {
  return Container(
      padding: EdgeInsets.only(left: 15, top: 15),
      child: SkeletonLine(
        style: SkeletonLineStyle(height: 200, width: double.infinity, borderRadius: BorderRadius.circular(8)),
      ));
}
