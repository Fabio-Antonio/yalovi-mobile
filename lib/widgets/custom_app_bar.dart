import 'dart:io';

import 'package:flutter/material.dart';
import 'package:platzi_trips_app/core/navigation/locator.dart';
import 'package:platzi_trips_app/core/navigation/services/navigation_services.dart';

class AppBarCustom extends StatefulWidget implements PreferredSizeWidget {
  final Widget titleToolbar;
  final VoidCallback? callback;
  final Color? colorBackground, colorIconBackOrHamburger;
  final bool allowBack;
  final bool allowMenu;
  final String? imageBase64;
  final double? elevation;
  final List<Widget>? actions;
  final Size? appBarSize;
  final double? toolbarHeigh;

  const AppBarCustom(
      {Key? key,
      required this.titleToolbar,
      this.allowBack = true,
      this.allowMenu = false,
      this.imageBase64,
      this.colorIconBackOrHamburger,
      this.colorBackground,
      this.elevation,
      this.callback,
      this.actions,
      this.appBarSize,
      this.toolbarHeigh})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AppBarCustom();
  }

  @override
  Size get preferredSize => appBarSize ?? Size(00.0, 40.0);
}

class _AppBarCustom extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    final leading = widget.allowBack
        ? IconButton(
            icon: Platform.isAndroid
                ? Icon(
                    Icons.arrow_back,
                    color: widget.colorIconBackOrHamburger ?? Colors.black,
                  )
                : Icon(Icons.arrow_back_ios, color: widget.colorIconBackOrHamburger ?? Colors.black),
            onPressed: widget.callback ??
                () {
                  locator<NavigationServices>().goBack();
                })
        : null;

    return AppBar(
      iconTheme: IconThemeData(color: widget.colorIconBackOrHamburger ?? Colors.white),
      elevation: widget.elevation ?? 1.0,
      automaticallyImplyLeading: widget.allowMenu,
      centerTitle: true,
      title: widget.titleToolbar,
      backgroundColor: widget.colorBackground ?? AppBarTheme.of(context).backgroundColor ?? Theme.of(context).primaryColor,
      actions: widget.actions,
      leading: leading,
      toolbarHeight: widget.toolbarHeigh,
    );
  }
}
