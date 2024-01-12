import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/features/checkout/data/datasource/pay_service.dart';
import 'package:platzi_trips_app/features/checkout/data/datasource/pay_service_impl.dart';
import 'package:platzi_trips_app/features/checkout/data/repository/pay_repository.dart';
import 'package:platzi_trips_app/features/checkout/data/repository/pay_repository_impl.dart';

final payApiProvider = Provider<PayService>((_) => PayServiceImpl());
final payRepositoryProvider =
Provider<PayRepository>((ref) => PayRepositoryImpl(ref.watch(payApiProvider)));