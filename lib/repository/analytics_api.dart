import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:platzi_trips_app/enviroment.dart';
import 'package:platzi_trips_app/ui/model/analytics.dart';

class analyticsApi {
  final String apiUrl = Enviroment().url_qa + "/analytical";

  List<Analytics> parseAnalytics(String responseBody) {
    print(jsonDecode(responseBody)["result"]);
    final parsed =
        jsonDecode(responseBody)["result"].cast<Map<String, dynamic>>();
    return parsed.map<Analytics>((json) => Analytics.fromJson(json)).toList();
  }

  Future<List<Analytics>> getAnalytics() async {
    var result = await http.get(Uri.parse(apiUrl));
    return parseAnalytics(result.body);
  }
}
