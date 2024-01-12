import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

Widget basicCardView({double height = 100.0, double width = 50.0}) {
  return ListView.builder(
      // padding: padding,
      scrollDirection: Axis.horizontal,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                padding: EdgeInsets.only(left: 15, top: 15),
                child: SkeletonLine(
                  style: SkeletonLineStyle(height: height, width: width, borderRadius: BorderRadius.circular(8)),
                )),
          ));
}
