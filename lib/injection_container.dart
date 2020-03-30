import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';

import 'core/Platform/network_info.dart';
import 'features/login_signup_screen/data/repos/login_signup_screen_repo_impl.dart';
import 'features/login_signup_screen/domain/repos/login_signup_screen_repo.dart';
import 'features/login_signup_screen/domain/usecases/get_facebook_login.dart';
import 'features/login_signup_screen/domain/usecases/get_google_login.dart';
import 'features/login_signup_screen/presentation/bloc/login_signup_screen_bloc.dart';
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

  //! Features - login_signup_screen

  // TODO: Need to update bloc when fully implemented

  //* Bloc
  sl.registerFactory(
    () => LoginSignupScreenBloc(),
  );

  //* usecases
  sl.registerLazySingleton(
    () => GetGoogleLogin(
      loginSignuScreenRepo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetFacebookLogin(
      loginSignuScreenRepo: sl(),
    ),
  );

  //* repo
  sl.registerLazySingleton<LoginSignuScreenRepo>(
    () => LoginSignupScreenRepoImpl(networkInfo: sl()),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External Libraries
  sl.registerLazySingleton(() => DataConnectionChecker());
}
