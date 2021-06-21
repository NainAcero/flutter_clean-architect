import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_example05/core/network/network_info.dart';
import 'package:flutter_example05/features/auth/data/data_sources/auth_data_source.dart';
import 'package:flutter_example05/features/auth/data/data_sources/local_data_source.dart';
import 'package:flutter_example05/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:flutter_example05/features/auth/data/repositories/local_storage_repository_impl.dart';
import 'package:flutter_example05/features/auth/domain/repositories/auth_repository.dart';
import 'package:flutter_example05/features/auth/domain/repositories/local_storage_repository.dart';
import 'package:flutter_example05/features/auth/domain/use_cases/authLogin_usecase.dart';
import 'package:flutter_example05/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter_example05/features/auth/domain/use_cases/clearAllData_useCases.dart';
import 'package:flutter_example05/features/auth/domain/use_cases/getToken_usecases.dart';
import 'package:flutter_example05/features/auth/domain/use_cases/saveToken_usecases.dart';
import 'package:flutter_example05/features/auth/domain/use_cases/saveUser_usecases.dart';
import 'package:flutter_example05/features/auth/domain/use_cases/getUser_usecases.dart';
import 'package:flutter_example05/features/auth/presentation/bloc/splash/splash_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {

  // ! Features -------------------------->
  // AUTH LOGIN

  // Bloc
  sl.registerFactory<AuthBloc>(() => AuthBloc(
    authLoginUseCase: sl(),
    saveTokenUseCase: sl(),
    saveUserUseCase: sl(),
    clearAllDataUseCase: sl(),
  ));
  sl.registerFactory<SplashBloc>(() => SplashBloc(
    getTokenUseCase: sl(),
  ));

  // Use Cases
  sl.registerLazySingleton(() => AuthLoginUseCase(sl()));
  sl.registerLazySingleton(() => ClearAllDataUseCase(sl()));
  sl.registerLazySingleton(() => GetTokenUseCase(sl()));
  sl.registerLazySingleton(() => GetUserUseCase(sl()));
  sl.registerLazySingleton(() => SaveTokenUseCase(sl()));
  sl.registerLazySingleton(() => SaveUserUseCase(sl()));

  // Repositories
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      authDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<LocalRepository>(
    () => LocalRepositoryImpl(
      localDataSource: sl()
    ),
  );

  // Data Sources
  sl.registerLazySingleton<AuthDataSource>(
    () => AuthDataSourceImpl(
      client: sl(),
    ),
  );
  sl.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(),
  );

  //! Core
    sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl()),
  );



  //! External
  sl.registerLazySingleton(() => http.Client());
    sl.registerLazySingleton(() => DataConnectionChecker());
}