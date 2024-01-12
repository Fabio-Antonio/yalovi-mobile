import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/features/card/data/repository/cart_repository.dart';
import 'package:platzi_trips_app/features/card/data/repository/cart_repository_impl.dart';
import 'package:platzi_trips_app/features/card/data/source/cart_service.dart';
import 'package:platzi_trips_app/features/card/data/source/cart_service_impl.dart';

final cartApiProvider = Provider<CartService>((_) => CartServiceImpl());
final cartRepositoryProvider =
Provider<CartRepository>((ref) => CartRepositoryImpl(ref.watch(cartApiProvider)));