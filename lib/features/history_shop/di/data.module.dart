import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/features/history_shop/data/repository/history_repository.dart';
import 'package:platzi_trips_app/features/history_shop/data/repository/history_repository_impl.dart';
import 'package:platzi_trips_app/features/history_shop/data/source/history_service.dart';
import 'package:platzi_trips_app/features/history_shop/data/source/history_service_impl.dart';

final historyApiProvider = Provider<HistoryService>((_) => HistoryServiceImpl());
final historyRepositoryProvider =
Provider<HistoryRepository>((ref) => HistoryRepositoryImpl(ref.watch(historyApiProvider)));
