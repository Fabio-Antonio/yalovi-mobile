import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/features/login/di/data.module.dart';
import 'package:platzi_trips_app/features/login/domain/usecases/get_verification_info_use_case.dart';
import 'package:platzi_trips_app/features/login/domain/usecases/get_verification_info_use_case_impl.dart';

final getVerificationUseCaseProvider = Provider<GetVerificationInfoUseCase>((ref) =>
    GetVerificationInfoUseCaseImpl(ref.watch(verificationRepositoryProvider)));
