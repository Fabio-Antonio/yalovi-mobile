import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

Widget skeletonCardsView({Axis scrollDirection = Axis.horizontal}) {
  return ListView.builder(
    // padding: padding,
    scrollDirection: scrollDirection,
    physics: NeverScrollableScrollPhysics(),
    itemCount: 4,
    itemBuilder: (context, index) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 320,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(color: Colors.white),
        child: SkeletonItem(
            child: Column(
          children: [
            SkeletonAvatar(
              style: SkeletonAvatarStyle(
                width: double.infinity,
                minHeight: MediaQuery.of(context).size.height / 8,
                maxHeight: 150,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: SkeletonParagraph(
                    style: SkeletonParagraphStyle(
                        lines: 3,
                        spacing: 6,
                        lineStyle: SkeletonLineStyle(
                          randomLength: true,
                          width: 120,
                          height: 10,
                          borderRadius: BorderRadius.circular(8),
                          minLength: MediaQuery.of(context).size.width / 6,
                          maxLength: MediaQuery.of(context).size.width / 3,
                        )),
                  ),
                )
              ],
            ),
          ],
        )),
      ),
    ),
  );
}
