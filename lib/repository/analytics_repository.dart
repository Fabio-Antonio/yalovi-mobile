import 'package:platzi_trips_app/repository/analytics_api.dart';
import 'package:platzi_trips_app/ui/model/analytics.dart';

class analyticsRepository {
  final _analyticasApi = analyticsApi();
  Future<List<Analytics>> getAnalytics() async {
    return await _analyticasApi.getAnalytics();
  }
}
