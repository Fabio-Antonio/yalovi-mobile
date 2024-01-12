import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/features/login/data/datasource/services/verification_service.dart';
import 'package:platzi_trips_app/features/login/data/datasource/services/verification_service_impl.dart';
import 'package:platzi_trips_app/features/login/data/repository/verification_repository.dart';
import 'package:platzi_trips_app/features/login/data/repository/verification_repository_impl.dart';

final verificationApiProvider = Provider<VerificationService>((_) => VerificationServiceImpl());
final verificationRepositoryProvider =
    Provider<VerificationRepository>((ref) => VerificationRepositoryImpl(ref.watch(verificationApiProvider)));
