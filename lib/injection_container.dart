import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:sieve_data_privacy_app/features/signup_screen/data/repos/signup_screen_repo_impl.dart';
import 'package:sieve_data_privacy_app/features/signup_screen/domain/repos/signup_screen_repo.dart';
import 'package:sieve_data_privacy_app/features/signup_screen/domain/usecases/get_signup.dart';

import 'core/Platform/network_info.dart';
import 'features/login_screen/data/repos/login_screen_repo_impl.dart';
import 'features/login_screen/domain/repos/login_screen_repo.dart';
import 'features/login_screen/domain/usecases/get_facebook_login.dart'
    as fbLoginScreen;
import 'features/login_screen/domain/usecases/get_google_login.dart'
    as gLoginScreen;
import 'features/login_screen/domain/usecases/get_login.dart';
import 'features/login_screen/presentation/bloc/login_screen_bloc.dart';
import 'features/login_signup_screen/data/repos/login_signup_screen_repo_impl.dart';
import 'features/login_signup_screen/domain/repos/login_signup_screen_repo.dart';
import 'features/login_signup_screen/domain/usecases/get_facebook_login.dart';
import 'features/login_signup_screen/domain/usecases/get_google_login.dart';
import 'features/login_signup_screen/presentation/bloc/login_signup_screen_bloc.dart';
import 'features/signup_screen/presentation/bloc/signup_screen_bloc.dart';
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
    () => LoginSignupScreenBloc(
      getFacebookLogin: sl(),
      getGoogleLogin: sl(),
    ),
  );

  //* usecases
  sl.registerLazySingleton(
    () => fbLoginScreen.GetFacebookLogin(
      loginScreenRepo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => gLoginScreen.GetGoogleLogin(
      loginRepo: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetLogin(
      repo: sl(),
    ),
  );

  //* repo
  sl.registerLazySingleton<LoginScreenRepo>(
    () => LoginScreenRepoImpl(networkInfo: sl(), loginSignuScreenRepo: sl()),
  );

  //! Features - login_screen

  // TODO: Need to update bloc when fully implemented

  //* Bloc
  sl.registerFactory(
    () => LoginScreenBloc(
      getFacebookLogin: sl(),
      getGoogleLogin: sl(),
      getLogin: sl(),
    ),
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

  //! Features - signup_screen

  // TODO: Need to update bloc when fully implemented

  //* Bloc
  sl.registerFactory(
    () => SignupScreenBloc(
      getSignup: sl(),
    ),
  );

  //* usecases
  sl.registerLazySingleton(
    () => GetSignup(
      signupRepo:  sl(),
    ),
  );


  //* repo
  sl.registerLazySingleton<SignupScreenRepo>(
    () => SignupScreenRepoImpl(networkInfo: sl()),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External Libraries
  sl.registerLazySingleton(() => DataConnectionChecker());
}
