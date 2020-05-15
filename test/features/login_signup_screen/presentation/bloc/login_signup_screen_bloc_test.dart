import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/Entities/empty_entity.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/features/login_screen/data/models/login_user_model.dart';
import 'package:sieve_data_privacy_app/features/login_signup_screen/domain/usecases/get_facebook_login.dart';
import 'package:sieve_data_privacy_app/features/login_signup_screen/domain/usecases/get_google_login.dart';
import 'package:sieve_data_privacy_app/features/login_signup_screen/presentation/bloc/login_signup_screen_bloc.dart';

class MockGetGoogleLogin extends Mock implements GetGoogleLogin {}

class MockGetFacebookLogin extends Mock implements GetFacebookLogin {}

void main() {
  MockGetFacebookLogin mockGetFacebookLogin;
  MockGetGoogleLogin mockGetGoogleLogin;
  LoginSignupScreenBloc loginSignupScreenBloc;

  setUp(() {
    mockGetFacebookLogin = new MockGetFacebookLogin();
    mockGetGoogleLogin = new MockGetGoogleLogin();
    loginSignupScreenBloc = new LoginSignupScreenBloc(
      getFacebookLogin: mockGetFacebookLogin,
      getGoogleLogin: mockGetGoogleLogin,
    );
  });

  final String id = '1';
  final String email = 'test1@gmail.com';
  final String password = 'Test@123';
  final String imageUrl = 'www.google.com';
  final String uid = '1';
  final LoginUserModel tLoginUserModel = new LoginUserModel(
      id: id, email: email, password: password, imageUrl: imageUrl, uid: uid);

  test(
    'initalState()',
    () async {
      //act
      final response = loginSignupScreenBloc.initialState;
      //assert
      expect(response, Initial());
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
        loginSignupScreenBloc.dispatch(GetFacebookLoginEvent());
        //assert
        final expected = [
          Initial(),
          Loading(),
          InternetError(),
        ];
        expectLater(loginSignupScreenBloc.state, emitsInOrder(expected));
      },
    );

    test(
      'should return [Loaded] when EmptyEntity is returned',
      () async {
        //arrange
        when(mockGetFacebookLogin(any))
            .thenAnswer((_) async => Right(tLoginUserModel));
        //act
        loginSignupScreenBloc.dispatch(GetFacebookLoginEvent());
        //assert
        final expected = [
          Initial(),
          Loading(),
          Loaded(loginUser: tLoginUserModel),
        ];
        expectLater(loginSignupScreenBloc.state, emitsInOrder(expected));
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
        loginSignupScreenBloc.dispatch(GetGoogleLoginEvent());
        //assert
        final expected = [
          Initial(),
          Loading(),
          InternetError(),
        ];
        expectLater(loginSignupScreenBloc.state, emitsInOrder(expected));
      },
    );

    test(
      'should return [Loaded] when EmptyEntity is returned',
      () async {
        //arrange
        when(mockGetGoogleLogin(any))
            .thenAnswer((_) async => Right(tLoginUserModel));
        //act
        loginSignupScreenBloc.dispatch(GetGoogleLoginEvent());
        //assert
        final expected = [
          Initial(),
          Loading(),
          Loaded(loginUser: tLoginUserModel),
        ];
        expectLater(loginSignupScreenBloc.state, emitsInOrder(expected));
      },
    );
  });


}

