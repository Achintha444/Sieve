import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:sieve_data_privacy_app/features/privacy_tips/data/datasources/privacy_tips_remote_datasource.dart';

import 'core/Platform/network_info.dart';
import 'features/bottom_nav/data/repos/bottom_nav_repo_impl.dart';
import 'features/bottom_nav/domain/repos/bottom_nav_repo.dart';
import 'features/bottom_nav/domain/usecases/navigate_to_category.dart';
import 'features/bottom_nav/domain/usecases/navigate_to_dashbaord.dart';
import 'features/bottom_nav/domain/usecases/navigate_to_news_feed.dart';
import 'features/bottom_nav/domain/usecases/navigate_to_privacy_laws.dart';
import 'features/bottom_nav/domain/usecases/navigate_to_privacy_tips.dart';
import 'features/bottom_nav/presentation/bloc/bottom_nav_bloc.dart';
import 'features/login_screen/data/datasources/login_screen_remote_datasource.dart';
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
import 'features/privacy_tips/data/repos/privacy_tips_repo_impl.dart';
import 'features/privacy_tips/domain/repos/privacy_tips_repo.dart';
import 'features/privacy_tips/domain/usecases/load_privacy_tips.dart';
import 'features/privacy_tips/presentation/bloc/privacy_tips_bloc.dart';
import 'features/signup_screen/data/datasources/signup_screen_remote_datasource.dart';
import 'features/signup_screen/data/repos/signup_screen_repo_impl.dart';
import 'features/signup_screen/domain/repos/signup_screen_repo.dart';
import 'features/signup_screen/domain/usecases/get_signup.dart';
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
  sl.registerLazySingleton<LoginSignuScreenRepo>(
    () => LoginSignupScreenRepoImpl(networkInfo: sl()),
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
  sl.registerLazySingleton<LoginScreenRepo>(
    () => LoginScreenRepoImpl(
        networkInfo: sl(),
        loginSignuScreenRepo: sl(),
        loginScreenRemoteDataSource: sl()),
  );

  //* datasource
  sl.registerLazySingleton<LoginScreenRemoteDataSource>(
      () => LoginScreenRemoteDataSourceImpl(httpClient: sl()));

  //! Features - signup_screen

  //* Bloc
  sl.registerFactory(
    () => SignupScreenBloc(
      getSignup: sl(),
    ),
  );

  //* usecases
  sl.registerLazySingleton(
    () => GetSignup(
      signupRepo: sl(),
    ),
  );

  //* repo
  sl.registerLazySingleton<SignupScreenRepo>(
    () => SignupScreenRepoImpl(
        networkInfo: sl(), signupScreenRemoteDataSource: sl()),
  );

  //* datasource
  sl.registerLazySingleton<SignupScreenRemoteDataSource>(
      () => SignupScreenRemoteDataSourceImpl(httpClient: sl()));

  //! Features - bottom_nav

  //* Bloc
  sl.registerFactory(
    () => BottomNavBloc(
      navigateToNewsFeed: sl(),
      navigateToCategory: sl(),
      navigateToDashboard: sl(),
      navigateToPrivacyLaws: sl(),
      navigateToPrivacyTips: sl(),
    ),
  );

  //* usecases
  sl.registerLazySingleton(
    () => NavigateToNewsFeed(
      bottomNavRepo: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => NavigateToCategory(
      bottomNavRepo: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => NavigateToDashboard(
      bottomNavRepo: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => NavigateToPrivacyTips(
      bottomNavRepo: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => NavigateToPrivacyLaws(
      bottomNavRepo: sl(),
    ),
  );

  //* repo
  sl.registerLazySingleton<BottomNavRepo>(
    () => BottomNavRepoImpl(networkInfo: sl()),
  );

  //* datasource

  //! Features - privacy_tips

  //* Bloc
  sl.registerFactory(
    () => PrivacyTipsBloc(
      loadPriavacyTips: sl(),
    ),
  );

  //* usecases
  sl.registerLazySingleton(
    () => LoadPriavacyTips(
      privacyTipsRepo: sl(),
    ),
  );

  //* repo
  sl.registerLazySingleton<PrivacyTipsRepo>(
    () => PrivacyTipsRepoImpl(
        networkInfo: sl(), privacyTipsRemoteDatasource:  sl()),
  );

  //* datasource
  sl.registerLazySingleton<PrivacyTipsRemoteDatasource>(
      () => PrivacyTipsRemoteDatasourceImpl(httpClient: sl()));

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External Libraries
  sl.registerLazySingleton(() => DataConnectionChecker());
  sl.registerLazySingleton(() => http.Client());
}
