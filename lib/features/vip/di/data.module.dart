import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/features/vip/data/repository/vip_repository.dart';
import 'package:platzi_trips_app/features/vip/data/repository/vip_repository_impl.dart';
import 'package:platzi_trips_app/features/vip/data/source/vip_service.dart';
import 'package:platzi_trips_app/features/vip/data/source/vip_service_impl.dart';

final vipApiProvider = Provider<VipService>((_) => VipServiceImpl());
final vipRepositoryProvider =
Provider<VipRepository>((ref) => VipRepositoryImpl(ref.watch(vipApiProvider)));