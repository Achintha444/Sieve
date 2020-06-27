import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/features/login_screen/data/models/login_user_model.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/usecases/get_facebook_login.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/usecases/get_google_login.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/usecases/get_login.dart';
import 'package:sieve_data_privacy_app/features/login_screen/presentation/bloc/login_screen_bloc.dart';

class MockGetFaceookLogin extends Mock implements GetFacebookLogin {}

class MockGetGoogleLogin extends Mock implements GetGoogleLogin {}

class MockGetLogin extends Mock implements GetLogin {}

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

  final String id = '1';
  final String email = 'test1@gmail.com';
  final String password = 'Test@123';
  final String imageUrl = 'www.google.com';
  final String uid = '1';
  final LoginUserModel tLoginUserModel = new LoginUserModel(
      id: id, email: email, password: password, imageUrl: imageUrl, uid: uid);

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
      'should return [ServerError] when ServerFaliure is returned',
      () async {
        //arrange
        when(mockGetFacebookLogin(any))
            .thenAnswer((_) async => Left(ServerFaliure()));
        //act
        loginScreenBloc.dispatch(GetFacebookLoginEvent());
        //assert
        final expected = [
          Initial(),
          Loading(),
          ServerError(),
        ];
        expectLater(loginScreenBloc.state, emitsInOrder(expected));
      },
    );

    test(
      'should return [UserBlockedError] when UserBlockedFaliure is returned',
      () async {
        //arrange
        when(mockGetFacebookLogin(any))
            .thenAnswer((_) async => Left(UserBlockedFaliure()));
        //act
        loginScreenBloc.dispatch(GetFacebookLoginEvent());
        //assert
        final expected = [
          Initial(),
          Loading(),
          UserBlockedError(),
        ];
        expectLater(loginScreenBloc.state, emitsInOrder(expected));
      },
    );

    test(
      'should return [Loaded] when LoginUser is returned',
      () async {
        //arrange
        when(mockGetFacebookLogin(any))
            .thenAnswer((_) async => Right(tLoginUserModel));
        //act
        loginScreenBloc.dispatch(GetFacebookLoginEvent());
        //assert
        final expected = [
          Initial(),
          Loading(),
          Loaded(loginUser: tLoginUserModel),
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
      'should return [ServerError] when ServerFaliure is returned',
      () async {
        //arrange
        when(mockGetGoogleLogin(any))
            .thenAnswer((_) async => Left(ServerFaliure()));
        //act
        loginScreenBloc.dispatch(GetGoogleLoginEvent());
        //assert
        final expected = [
          Initial(),
          Loading(),
          ServerError(),
        ];
        expectLater(loginScreenBloc.state, emitsInOrder(expected));
      },
    );

    test(
      'should return [UserBlockedError] when UserBlockedFaliure is returned',
      () async {
        //arrange
        when(mockGetGoogleLogin(any))
            .thenAnswer((_) async => Left(UserBlockedFaliure()));
        //act
        loginScreenBloc.dispatch(GetGoogleLoginEvent());
        //assert
        final expected = [
          Initial(),
          Loading(),
          UserBlockedError(),
        ];
        expectLater(loginScreenBloc.state, emitsInOrder(expected));
      },
    );

    test(
      'should return [Loaded] when EmptyEntity is returned',
      () async {
        //arrange
        when(mockGetGoogleLogin(any))
            .thenAnswer((_) async => Right(tLoginUserModel));
        //act
        loginScreenBloc.dispatch(GetGoogleLoginEvent());
        //assert
        final expected = [
          Initial(),
          Loading(),
          Loaded(loginUser: tLoginUserModel),
        ];
        expectLater(loginScreenBloc.state, emitsInOrder(expected));
      },
    );
  });

  group('GetLogin', () {
    final String id = '1';
    final String email = 'test@gmail.com';
    final String password = 'Test@123';
    final LoginUser loginUser = new LoginUser(
        id: id, email: email, password: password, imageUrl: null, uid: null);

    test(
      'should return [InternetError] when InternetConnectionFaliure is returned',
      () async {
        //arrange
        when(mockGetLogin(any))
            .thenAnswer((_) async => Left(InternetConnectionFaliure()));
        //act
        loginScreenBloc
            .dispatch(GetLoginEvent(email: email, password: password));
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
      'should return [InvalidInputError] when InternetConnectionFaliure is returned',
      () async {
        //arrange
        when(mockGetLogin(any))
            .thenAnswer((_) async => Left(InvalidInputFaliure()));
        //act
        loginScreenBloc
            .dispatch(GetLoginEvent(email: email, password: password));
        //assert
        final expected = [
          Initial(),
          Loading(),
          InvalidInputError(),
        ];
        expectLater(loginScreenBloc.state, emitsInOrder(expected));
      },
    );

    test(
      'should return [ServerError] when InternetConnectionFaliure is returned',
      () async {
        //arrange
        when(mockGetLogin(any)).thenAnswer((_) async => Left(ServerFaliure()));
        //act
        loginScreenBloc
            .dispatch(GetLoginEvent(email: email, password: password));
        //assert
        final expected = [
          Initial(),
          Loading(),
          ServerError(),
        ];
        expectLater(loginScreenBloc.state, emitsInOrder(expected));
      },
    );

    test(
      'should return [UserBlockedError] when UserBlockedFaliure is returned',
      () async {
        //arrange
        when(mockGetLogin(any))
            .thenAnswer((_) async => Left(UserBlockedFaliure()));
        //act
        loginScreenBloc
            .dispatch(GetLoginEvent(email: email, password: password));
        //assert
        final expected = [
          Initial(),
          Loading(),
          UserBlockedError(),
        ];
        expectLater(loginScreenBloc.state, emitsInOrder(expected));
      },
    );

    test(
      'should return [Loaded] when EmptyEntity is returned',
      () async {
        //arrange
        when(mockGetLogin(any)).thenAnswer((_) async => Right(loginUser));
        //act
        loginScreenBloc
            .dispatch(GetLoginEvent(email: email, password: password));
        //assert
        final expected = [
          Initial(),
          Loading(),
          Loaded(loginUser: loginUser),
        ];
        expectLater(loginScreenBloc.state, emitsInOrder(expected));
      },
    );
  });
}
