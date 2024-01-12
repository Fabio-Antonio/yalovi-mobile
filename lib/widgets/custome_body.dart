import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget setCustomBody(
    {String? backgroundAssetRoute,
      Widget? body,
      Widget? loader,
      Widget? init,
      Widget? empty,
    }) {
  return Stack(
    children: [
      backgroundAssetRoute != null
          ? Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(backgroundAssetRoute),
                  fit: BoxFit.cover)))
          : Container(),
      empty ?? Container(),
      init ?? Container(),
      body ?? Container(),
      loader ?? Container(),
    ],
  );
}