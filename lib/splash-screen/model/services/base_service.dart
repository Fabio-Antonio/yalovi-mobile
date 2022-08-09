import 'package:platzi_trips_app/contants.dart';

abstract class BaseService {
  final String baseUrl = Constants().url_qa+"/configuration";

  Future<dynamic> getConfiguration();

}