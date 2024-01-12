import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/core/navigation/constants/router_paths.dart';
import 'package:platzi_trips_app/features/catalogue/framework/presentation/view/screen/catalogue_screen.dart';
import 'package:platzi_trips_app/features/checkout/framework/presentation/view/screen/pay_screen.dart';
import 'package:platzi_trips_app/features/home_shop/framework/presentation/view/screen/home_screen.dart';
import 'package:platzi_trips_app/features/vip/framework/presentation/view/screen/vip_screen.dart';
import 'package:platzi_trips_app/widgets/navigation_custome.dart';

import '../../features/login/framework/presentation/view/screen/sign_in_screen.dart';


Route<dynamic> generateRoute(RouteSettings settings, {dynamic arguments}) {
  switch (settings.name) {
    case pageSignInScreen:
      return NavigationCustom(widget:  ProviderScope(child: SignInScreen()));
    case pageHome:
      return NavigationCustom(widget:  ProviderScope(child: Home()));
    case pagePay :
      return NavigationCustom(widget: ProviderScope(child: PayScreen(),),directionRight: true);
    case pageCatalogue:
      return NavigationCustom(widget: ProviderScope(child: CatalogueScreen(),),directionRight: true);
    case pageVipProducts:
      return NavigationCustom(widget: ProviderScope(child: VipProductScreen(),),directionRight: true);
    default:
      return MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(
            child: Text('El módulo no está disponible.'),
          ),
        ),
      );
  }
}
