import 'package:platzi_trips_app/user/repository/analytics_api.dart';
import 'package:platzi_trips_app/user/ui/model/analytics.dart';

class analyticsRepository {
  final _analyticasApi = analyticsApi();
  Future<List<Analytics>> getAnalytics() async {
    return await _analyticasApi.getAnalytics();
  }
}
