import 'dart:io';

import 'package:flutter/material.dart';

const double _sizeButtonFlag = 14.0;
const double _sizeRadius = 20.0;

void showButtonSheetCustom(
    {Key? key,
      required final BuildContext context,
      required final Text? title,
      message,
      final String? textOk,
      final String? textCancel,
      final bool? isDismissible,
      final TextStyle? textStyleButtonFlag,
      final Widget? child,
      final VoidCallback? callbackOk,
      final VoidCallback? callbackCancel,
      final bool executeOnDismiss = false
    }) async {
  showModalBottomSheet(
      context: context,
      isDismissible: isDismissible ?? true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(_sizeRadius), topRight: Radius.circular(_sizeRadius)),
      ),
      builder: (BuildContext buildContext) {
        return WillPopScope(
          onWillPop: () {
            return Future.value(isDismissible ?? true);
          },
          child: SizedBox(
            height: 100,
            child: Wrap(children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
                child: Center(child: title),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5, left: 20, right: 20),
                child: Center(child: message),
              ),
              Center(child: child),
              Container(
                margin: EdgeInsets.only(top: 5.0, bottom: Platform.isAndroid ? 12.0 : 22.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
                  Visibility(
                    visible: textCancel != null,
                    child: TextButton(
                      child: Text(textCancel ?? "CANCEL",
                          style: textStyleButtonFlag ??
                              const TextStyle(
                                  fontSize: _sizeButtonFlag, fontStyle: FontStyle.normal, color: Colors.black)),
                      onPressed: callbackCancel != null
                          ? () {
                        callbackCancel();
                        Navigator.of(context).pop();
                      }
                          : () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Visibility(
                    visible: textOk != null,
                    child: TextButton(
                      child: Text(textOk ?? "OK",
                          style: textStyleButtonFlag ??
                              TextStyle(
                                  fontSize: 18,
                                  fontStyle: FontStyle.normal,
                                  color: Colors.black)),
                      onPressed: callbackOk != null
                          ? () {
                        callbackOk.call();
                        Navigator.of(context).pop();
                      }
                          : () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ]),
              )
            ]),
          ),
        );
      })

  /*.whenComplete(() {
    if (executeOnDismiss && callbackOk != null) {
      callbackOk();
    }})*/;
}