import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/Entities/empty_entity.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/splash_screen/domain/usecases/auto_login.dart';
import 'package:sieve_data_privacy_app/features/splash_screen/domain/usecases/navigate_to_login_screen.dart';
import 'package:sieve_data_privacy_app/features/splash_screen/presentation/bloc/splash_screen_bloc.dart';

class MockNavigateToLoginScreen extends Mock implements NavigateToLoginScreen {}

class MockAutoLogin extends Mock implements AutoLogin {}

class MockLoginUser extends Mock implements LoginUser {}

main() {
  SplashScreenBloc splashScreenBloc;
  MockNavigateToLoginScreen mockNavigateToLoginScreen;
  MockAutoLogin mockAutoLogin;
  MockLoginUser mockLoginUser;

  setUp(() {
    mockLoginUser = new MockLoginUser();
    mockNavigateToLoginScreen = new MockNavigateToLoginScreen();
    mockAutoLogin = new MockAutoLogin();
    splashScreenBloc = new SplashScreenBloc(
      navigateToMainScreen: mockNavigateToLoginScreen,
      autoLogin: mockAutoLogin,
    );
  });

  test(
    'initialState()',
    () async {
      //act
      final result = splashScreenBloc.initialState;
      //assert
      expect(result, Initial());
    },
  );

  test(
    'should emit [Loading,LoadedUser] when the auto login successful',
    () async {
      //arrange
      when(mockAutoLogin(any)).thenAnswer((_) async => Right(mockLoginUser));
      //act
      splashScreenBloc.dispatch(NavigateToLoginScreenEvent());
      //assert
      final exp = [Initial(), Loading(), LoadedUser(loginUser: mockLoginUser)];
      expectLater(splashScreenBloc.state, emitsInOrder(exp));
    },
  );

  group('Auto Login Faliure', () {
    setUp(() {
      when(mockAutoLogin(any)).thenAnswer((_) async => Left(CacheFaliure()));
    });

    test(
      'should emit [Loading,Loaded] when the auto login failed and internet connection is successfull',
      () async {
        //arrange
        when(mockNavigateToLoginScreen(any))
            .thenAnswer((_) async => Right(EmptyEntity()));
        //act
        splashScreenBloc.dispatch(NavigateToLoginScreenEvent());
        //assert
        final exp = [Initial(), Loading(), Loaded()];
        expectLater(splashScreenBloc.state, emitsInOrder(exp));
      },
    );

    test(
      'should emit [Loading,InternetError] when the auto login failed and internet connection is successfull',
      () async {
        //arrange
        when(mockNavigateToLoginScreen(any))
            .thenAnswer((_) async => Left(InternetConnectionFaliure()));
        //act
        splashScreenBloc.dispatch(NavigateToLoginScreenEvent());
        //assert
        final exp = [Initial(), Loading(), InternetError()];
        expectLater(splashScreenBloc.state, emitsInOrder(exp));
      },
    );
  });
}
