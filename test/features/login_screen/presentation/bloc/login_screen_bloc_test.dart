import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/Entities/empty_entity.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/usecases/get_facebook_login.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/usecases/get_google_login.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/usecases/get_login.dart';
import 'package:sieve_data_privacy_app/features/login_screen/presentation/bloc/login_screen_bloc.dart';

class MockGetFaceookLogin extends Mock implements GetFacebookLogin {}

class MockGetGoogleLogin extends Mock implements GetGoogleLogin {}

class MockGetLogin extends Mock implements GetLogin {}

// TODO: Complete the test aafter full implementaion

void main() {
  MockGetFaceookLogin mockGetFacebookLogin;
  MockGetGoogleLogin mockGetGoogleLogin;
  MockGetLogin mockGetLogin;
  LoginScreenBloc loginScreenBloc;

  setUp(() {
    mockGetFacebookLogin = new MockGetFaceookLogin();
    mockGetGoogleLogin = new MockGetGoogleLogin();
    mockGetLogin = new MockGetLogin();
    loginScreenBloc = new LoginScreenBloc(
        getFacebookLogin: mockGetFacebookLogin,
        getGoogleLogin: mockGetGoogleLogin,
        getLogin: mockGetLogin);
  });

  test(
    'initialState()',
    () async {
      //act
      final result = loginScreenBloc.initialState;
      //assert
      expect(result, Initial());
    },
  );

  group('GetFacebookLogin', () {
    test(
      'should return [InternetError] when InternetConnectionFaliure is returned',
      () async {
        //arrange
        when(mockGetFacebookLogin(any))
            .thenAnswer((_) async => Left(InternetConnectionFaliure()));
        //act
        loginScreenBloc.dispatch(GetFacebookLoginEvent());
        //assert
        final expected = [
          Initial(),
          Loading(),
          InternetError(),
        ];
        expectLater(loginScreenBloc.state, emitsInOrder(expected));
      },
    );

    test(
      'should return [Loaded] when EmptyEntity is returned',
      () async {
        //arrange
        when(mockGetFacebookLogin(any))
            .thenAnswer((_) async => Right(EmptyEntity()));
        //act
        loginScreenBloc.dispatch(GetFacebookLoginEvent());
        //assert
        final expected = [
          Initial(),
          Loading(),
          Loaded(),
        ];
        expectLater(loginScreenBloc.state, emitsInOrder(expected));
      },
    );
  });

  group('GetGoogleLogin', () {
    test(
      'should return [InternetError] when InternetConnectionFaliure is returned',
      () async {
        //arrange
        when(mockGetGoogleLogin(any))
            .thenAnswer((_) async => Left(InternetConnectionFaliure()));
        //act
        loginScreenBloc.dispatch(GetGoogleLoginEvent());
        //assert
        final expected = [
          Initial(),
          Loading(),
          InternetError(),
        ];
        expectLater(loginScreenBloc.state, emitsInOrder(expected));
      },
    );

    test(
      'should return [Loaded] when EmptyEntity is returned',
      () async {
        //arrange
        when(mockGetGoogleLogin(any))
            .thenAnswer((_) async => Right(EmptyEntity()));
        //act
        loginScreenBloc.dispatch(GetGoogleLoginEvent());
        //assert
        final expected = [
          Initial(),
          Loading(),
          Loaded(),
        ];
        expectLater(loginScreenBloc.state, emitsInOrder(expected));
      },
    );
  });

  group('GetLogin', () {

    final String email = 'test@gmail.com';
    final String password = 'testPassword';

    test(
      'should return [InternetError] when InternetConnectionFaliure is returned',
      () async {
        //arrange
        when(mockGetLogin(any))
            .thenAnswer((_) async => Left(InternetConnectionFaliure()));
        //act
        loginScreenBloc.dispatch(GetLoginEvent(email: email,password: password));
        //assert
        final expected = [
          Initial(),
          Loading(),
          InternetError(),
        ];
        expectLater(loginScreenBloc.state, emitsInOrder(expected));
      },
    );

    test(
      'should return [Loaded] when EmptyEntity is returned',
      () async {
        //arrange
        when(mockGetLogin(any))
            .thenAnswer((_) async => Right(EmptyEntity()));
        //act
        loginScreenBloc.dispatch(GetLoginEvent(email: email,password: password));
        //assert
        final expected = [
          Initial(),
          Loading(),
          Loaded(),
        ];
        expectLater(loginScreenBloc.state, emitsInOrder(expected));
      },
    );
  });
}
