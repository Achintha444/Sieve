import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/Entities/empty_entity.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/features/splash_screen/domain/usecases/navigate_to_login_screen.dart';
import 'package:sieve_data_privacy_app/features/splash_screen/presentation/bloc/splash_screen_bloc.dart';

class MockNavigateToLoginScreen extends Mock implements NavigateToLoginScreen {}

main() {
  SplashScreenBloc splashScreenBloc;
  MockNavigateToLoginScreen mockNavigateToLoginScreen;

  setUp(() {
    mockNavigateToLoginScreen = new MockNavigateToLoginScreen();
    splashScreenBloc =
        new SplashScreenBloc(navigateToMainScreen: mockNavigateToLoginScreen);
  });

  test(
    'initialState()',
    () async {
      //arrange
      //when(splashScreenBloc.initialState).thenReturn(initialState);
      //act
      final result = splashScreenBloc.initialState;
      //assert
      expect(result, Initial());
    },
  );

  test(
    'should emit [Loading, InternetError] when there is no internet connection',
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

    test(
    'should emit [Loading, Loaded] when there is internet connection',
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
}
