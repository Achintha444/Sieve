import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';

import 'core/Platform/network_info.dart';
import 'features/splash_screen/data/repos/splash_screen_repo_impl.dart';
import 'features/splash_screen/domain/repos/splash_screen_repo.dart';
import 'features/splash_screen/domain/usecases/navigate_to_login_screen.dart';
import 'features/splash_screen/presentation/bloc/splash_screen_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //! Features - splash_screen

  //* Bloc
  sl.registerFactory(
    () => SplashScreenBloc(
      navigateToMainScreen: sl(),
    ),
  );

  //* usecases
  sl.registerLazySingleton(
    () => NavigateToLoginScreen(
      splashScreenRepo: sl(),
    ),
  );

  //* repo

  sl.registerLazySingleton<SplashScreenRepo>(
    () => SplashScreenRepoImpl(
      networkInfo: sl(),
    ),
  );

  
  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External Libraries
  sl.registerLazySingleton(() => DataConnectionChecker());
}
