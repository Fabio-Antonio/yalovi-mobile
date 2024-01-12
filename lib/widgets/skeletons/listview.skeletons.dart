import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

Widget SkeletonView() => ListView.builder(
      // padding: padding,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 50,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(color: Colors.white),
          child: SkeletonItem(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SkeletonLine(
                    style: SkeletonLineStyle(height: 16, width: 130, borderRadius: BorderRadius.circular(8)),
                  ),
                  Row(
                    children: [
                      SkeletonAvatar(style: SkeletonAvatarStyle(width: 20, height: 20)),
                      SizedBox(width: 8),
                      SkeletonAvatar(style: SkeletonAvatarStyle(width: 20, height: 20)),
                      SizedBox(width: 8),
                      SkeletonAvatar(style: SkeletonAvatarStyle(width: 20, height: 20)),
                    ],
                  ),
                ],
              )
            ],
          )),
        ),
      ),
    );
