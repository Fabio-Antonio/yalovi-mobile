
import 'package:permission_handler/permission_handler.dart';

class Constants {
  String url_local =
      "http://192.168.0.179:3000/api";
  String url_qa = "http://192.168.0.179:3000/api";
  List<Permission> appPermissions = [Permission.location,Permission.storage,Permission.camera];
  double searchTitleBar = 0.25;
  double simpleBar = 0.23;
  double get _searchTitleBar => searchTitleBar;
  double get _simpleBar => simpleBar;
  String get _url_qa => url_qa;
  String get _url_local => url_local;
  List<Permission> get _appPermissions => appPermissions;

}
