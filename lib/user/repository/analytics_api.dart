import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:platzi_trips_app/enviroment.dart';
import 'package:platzi_trips_app/singleton/security_singleton.dart';
import 'package:platzi_trips_app/user/model/analytics.dart';

class analyticsApi {
  final String apiUrl = Enviroment().url_qa + "/analytical";
  final _securitySingleton = securitySingleton.instance;
  List<Analytics> parseAnalytics(String responseBody) {
    print(jsonDecode(responseBody)["result"]);
    final parsed =
        jsonDecode(responseBody)["result"].cast<Map<String, dynamic>>();
    return parsed.map<Analytics>((json) => Analytics.fromJson(json)).toList();
  }

  Future<List<Analytics>> getAnalytics() async {
    var result = await http.get(Uri.parse(apiUrl), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'x-token': _securitySingleton!.tokenAccess
    });
    return parseAnalytics(result.body);
  }
}
