import 'dart:convert';
import 'dart:io';
import 'package:meta/meta.dart';

import 'package:http/http.dart' as http;
import 'package:platzi_trips_app/splash-screen/model/apis/app_exception.dart';

import 'base_service.dart';


class ConfigurationService extends BaseService {
  @override
  Future getConfiguration() async {
    dynamic responseJson;
    try {
      final response = await http.get(Uri.parse(baseUrl));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }
}