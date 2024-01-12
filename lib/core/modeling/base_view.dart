import 'package:flutter/material.dart';
import 'package:platzi_trips_app/core/modeling/dto/error_ui.dart';
import 'package:platzi_trips_app/core/navigation/locator.dart';
import 'package:platzi_trips_app/core/navigation/services/navigation_services.dart';
import 'package:platzi_trips_app/widgets/modals/custome-button-sheet.dart';


class BaseView {
  final NavigationServices navigator = locator<NavigationServices>();

  messageError(BuildContext context, ErrorUi errorUi) {
    showMessage(
        context: context, title: errorUi.title ?? "", message: errorUi.message ?? "");
  }

  showMessage(
      {required BuildContext context,
        required String title,
        required String message,
        String? textOk,
        String? textCancel,
        bool? isDismissible,
        VoidCallback? callbackOk}) {
    showButtonSheetCustom(
        context: context,
        title: Text(
          title,
          style: TextStyle(fontSize: 18),
        ),
        message: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
        textOk: textOk,
        textCancel: textCancel,
        isDismissible: isDismissible,
        callbackOk: callbackOk);
  }
}