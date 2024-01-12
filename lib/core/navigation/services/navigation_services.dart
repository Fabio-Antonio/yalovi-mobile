import 'package:flutter/widgets.dart';

class NavigationServices {
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(final String routeName, {arguments}) {
    return navigationKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  void goBack() {
    navigationKey.currentState!.pop();
  }
}