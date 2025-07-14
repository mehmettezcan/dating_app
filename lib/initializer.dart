import 'package:dating_app/core/interceptors/auth_interceptor.dart';
import 'package:dating_app/core/interceptors/dio_interceptor.dart';
import 'package:dating_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:dating_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dating_app/features/auth/domain/repositories/auth_repository_impl.dart';
import 'package:dating_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:dating_app/features/home/data/datasources/home_remote_datasources.dart';
import 'package:dating_app/features/home/domain/repositories/home_repository.dart';
import 'package:dating_app/features/home/domain/repositories/home_repository_impl.dart';
import 'package:dating_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:dating_app/features/profile/data/datasources/profile_remote_datasource.dart';
import 'package:dating_app/features/profile/domain/repositories/profile_repository.dart';
import 'package:dating_app/features/profile/domain/repositories/profile_repository_impl.dart';
import 'package:dating_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:loggy/loggy.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initializeGetIt() async {
  Loggy.initLoggy(
    logPrinter:
        (kReleaseMode)
            ? CustomLoggerPrinter()
            : const PrettyPrinter(showColors: true),
    logOptions:
        (kReleaseMode)
            ? const LogOptions(LogLevel.error)
            : const LogOptions(LogLevel.all),
  );
  getIt.registerLazySingleton(() => Loggy('DatingApp_Log:'));

  final prefs = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(prefs);

  FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  getIt.registerLazySingleton<FirebaseAnalytics>(() => analytics);
  // Services (APIs)
  getIt.registerSingleton<Dio>(Dio());
  getIt<Dio>().options.baseUrl = "https://caseapi.servicelabs.tech";
  getIt<Dio>().interceptors.addAll([DioInterceptor(), AuthInterceptor()]);

  // Repositories
  // Auth
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(getIt<Dio>()),
  );
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt<AuthRemoteDataSource>()),
  );
  getIt.registerFactory<AuthBloc>(() => AuthBloc(getIt<AuthRepository>()));

  // Home
  getIt.registerLazySingleton<HomeRemoteDatasources>(
    () => HomeRemoteDatasources(getIt<Dio>()),
  );
  getIt.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(getIt<HomeRemoteDatasources>()),
  );
  getIt.registerFactory<HomeBloc>(() => HomeBloc(getIt<HomeRepository>()));

  // Profile
  getIt.registerLazySingleton<ProfileRemoteDatasource>(
    () => ProfileRemoteDatasource(getIt<Dio>()),
  );
  getIt.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(getIt<ProfileRemoteDatasource>()),
  );
  getIt.registerFactory<ProfileBloc>(
    () => ProfileBloc(getIt<ProfileRepository>(), getIt<HomeRepository>()),
  );
}

class CustomLoggerPrinter extends PrettyPrinter {}
