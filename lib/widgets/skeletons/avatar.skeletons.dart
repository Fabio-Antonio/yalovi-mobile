import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

Widget AvatarsView() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Divider(),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SkeletonAvatar(
            style: SkeletonAvatarStyle(borderRadius: BorderRadius.circular(32), height: 62, width: 62),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: EdgeInsets.only(left: 15),
              child: SkeletonLine(
                style: SkeletonLineStyle(height: 16, width: 130, borderRadius: BorderRadius.circular(8)),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 15,top: 15),
              child: SkeletonLine(
                style: SkeletonLineStyle(height: 16, width: 130, borderRadius: BorderRadius.circular(8)),
              ),
            )
          ])
        ],
      ),
    ],
  );
}
