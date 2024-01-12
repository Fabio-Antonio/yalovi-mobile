import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

Widget skeletonCartCardsView() => SkeletonListView(
  item: SkeletonListTile(
    verticalSpacing: 12,
    leadingStyle: SkeletonAvatarStyle(
        width: 64, height: 64, shape: BoxShape.rectangle),
    titleStyle: SkeletonLineStyle(
        height: 16,
        minLength: 200,
        randomLength: true,
        borderRadius: BorderRadius.circular(12)),
    subtitleStyle: SkeletonLineStyle(
        height: 12,
        maxLength: 200,
        randomLength: true,
        borderRadius: BorderRadius.circular(12)),
    hasSubtitle: true,
  ),
);