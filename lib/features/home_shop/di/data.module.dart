import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/features/home_shop/data/datasource/home_services.dart';
import 'package:platzi_trips_app/features/home_shop/data/datasource/home_services_impl.dart';
import 'package:platzi_trips_app/features/home_shop/data/repository/home_repository.dart';
import 'package:platzi_trips_app/features/home_shop/data/repository/home_repository_impl.dart';

final homeApiProvider = Provider<HomeService>((_) => HomeServiceImpl());
final homeRepositoryProvider =
Provider<HomeRepository>((ref) => HomeRepositoryImpl(ref.watch(homeApiProvider)));
