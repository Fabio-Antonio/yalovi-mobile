import 'package:platzi_trips_app/features/home_shop/framework/model/drawer_item.dart';
import 'package:platzi_trips_app/features/login/framework/model/user.dart';

class DrawerInfoDto {
  final List<DrawerItem>? options;
  final UserAuth? userAuth;

  DrawerInfoDto({this.options, this.userAuth});
}
