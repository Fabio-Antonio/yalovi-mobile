import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:platzi_trips_app/core/features/firebase_session/data/datasource/session_service.dart';
import 'package:platzi_trips_app/core/features/firebase_session/data/repository/session_repository.dart';
import 'package:platzi_trips_app/core/features/firebase_session/framework/implementations/data/datasource/session_service_impl.dart';
import 'package:platzi_trips_app/core/features/firebase_session/framework/implementations/data/repository/session_repository_impl.dart';
import 'package:platzi_trips_app/core/features/firebase_session/framework/implementations/usecase/get_session_status_use_case_impl.dart';
import 'package:platzi_trips_app/core/features/firebase_session/framework/implementations/usecase/sign_in_use_case_impl.dart';
import 'package:platzi_trips_app/core/features/firebase_session/framework/implementations/usecase/sign_out_use_case.dart';
import 'package:platzi_trips_app/core/features/firebase_session/usecases/get_session_status_use_case.dart';
import 'package:platzi_trips_app/core/features/firebase_session/usecases/sign_in_use_case.dart';
import 'package:platzi_trips_app/core/features/firebase_session/usecases/sign_out_use_case.dart';

final sessionServicesProvider = Provider<SessionService>(
        (_) => SessionServiceImpl());
final sessionRepositoryProvider = Provider<SessionRepository>(
        (ref) => SessionRepositoryImpl(ref.watch(sessionServicesProvider)));
final signInUseCaseProvider = Provider<SignInUseCase>((ref) =>
    SignInUseCaseImpl(ref.watch(sessionRepositoryProvider),));
final signOutUseCaseProvider = Provider<SignOutUseCase>((ref) =>
    SignOutUseCaseImpl(ref.watch(sessionRepositoryProvider),));
final sessionStatusUseCaseProvider = Provider<SessionStatusUseCase>((ref) =>
    SessionStatusUseCaseImpl(ref.watch(sessionRepositoryProvider),));