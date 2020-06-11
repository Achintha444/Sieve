import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/core/Usecase/use_case.dart';
import 'package:sieve_data_privacy_app/features/login_screen/data/models/login_user_model.dart';
import 'package:sieve_data_privacy_app/features/login_signup_screen/domain/repos/login_signup_screen_repo.dart';
import 'package:sieve_data_privacy_app/features/login_signup_screen/domain/usecases/get_facebook_login.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockLoginSignupScreenRepo extends Mock implements LoginSignuScreenRepo {}

void main() {
  MockLoginSignupScreenRepo mockLoginSignupScreenRepo;
  GetFacebookLogin getFacebookLogin;

  setUp(() {
    mockLoginSignupScreenRepo = new MockLoginSignupScreenRepo();
    getFacebookLogin =
        new GetFacebookLogin(loginSignuScreenRepo: mockLoginSignupScreenRepo);
  });

  test(
    'should return LoginUser when opertaes correctly',
    () async {
      //arrange
      when(mockLoginSignupScreenRepo.getFacebookLogin()).thenAnswer((_) async =>
          Right(LoginUserModel.fromJson(
              json.decode(fixtureReader('login_user_gf_fixture.json')))));
      //act
      final result = await getFacebookLogin(NoParams());
      //assert
      expect(result, Right(LoginUserModel.fromJson(
              json.decode(fixtureReader('login_user_gf_fixture.json')))));
      verify(mockLoginSignupScreenRepo.getFacebookLogin());
      verifyNoMoreInteractions(mockLoginSignupScreenRepo);
    },
  );

  test(
    'should return ServerFaliure() when something went wron',
    () async {
      //arrange
      when(mockLoginSignupScreenRepo.getFacebookLogin())
          .thenAnswer((_) async => Left(ServerFaliure()));
      //act
      final result = await getFacebookLogin(NoParams());
      //assert
      expect(result, Left(ServerFaliure()));
      verify(mockLoginSignupScreenRepo.getFacebookLogin());
      verifyNoMoreInteractions(mockLoginSignupScreenRepo);
    },
  );

  test(
    'should return InternetConnectionFaliure() when something went wron',
    () async {
      //arrange
      when(mockLoginSignupScreenRepo.getFacebookLogin())
          .thenAnswer((_) async => Left(InternetConnectionFaliure()));
      //act
      final result = await getFacebookLogin(NoParams());
      //assert
      expect(result, Left(InternetConnectionFaliure()));
      verify(mockLoginSignupScreenRepo.getFacebookLogin());
      verifyNoMoreInteractions(mockLoginSignupScreenRepo);
    },
  );


}

