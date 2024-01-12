import 'package:platzi_trips_app/features/home_shop/domain/mapper/options_mapper.dart';
import 'package:platzi_trips_app/features/home_shop/framework/model/drawer_response.dart';

class DrawerResponseMapper {
  static DrawerResponse fromJson(Map<String, dynamic> parsedJson) {
    return DrawerResponse(options: DrawerItemMapper.fromJsonList(parsedJson['options']));
  }
}
