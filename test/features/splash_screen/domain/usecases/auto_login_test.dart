import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/core/Usecase/use_case.dart';
import 'package:sieve_data_privacy_app/features/login_screen/data/models/login_user_model.dart';
import 'package:sieve_data_privacy_app/features/splash_screen/domain/repos/splash_screen_repo.dart';
import 'package:sieve_data_privacy_app/features/splash_screen/domain/usecases/auto_login.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockSplashScreenRepo extends Mock implements SplashScreenRepo {}

void main() {
  MockSplashScreenRepo mockSplashScreenRepo;
  AutoLogin autoLogin;

  setUp(() {
    mockSplashScreenRepo = new MockSplashScreenRepo();
    autoLogin = new AutoLogin(splashScreenRepo: mockSplashScreenRepo);
  });

  final loginUserModel = LoginUserModel.fromJson(
      json.decode(fixtureReader('login_user_fixture.json')));

  test(
    'should return LoginUserModel when the user has been previously logged in',
    () async {
      //arrange
      when(mockSplashScreenRepo.autoLogin())
          .thenAnswer((_) async => Right(loginUserModel));
      //act
      final response = await autoLogin(NoParams());
      //assert
      expect(response, Right(loginUserModel));
      verify(mockSplashScreenRepo.autoLogin());
      verifyNoMoreInteractions(mockSplashScreenRepo);
    },
  );

  test(
    'should return CacheFaliure() when there is no internet',
    () async {
      //arrange
      when(mockSplashScreenRepo.autoLogin()).thenAnswer(
        (_) async => Left(CacheFaliure()),
      );
      //act
      final result = await autoLogin(NoParams());
      //assert
      //prefix0.expect(actual, matcher)
      expect(result, Left(CacheFaliure()));
      verify(mockSplashScreenRepo.autoLogin());
      verifyNoMoreInteractions(mockSplashScreenRepo);
    },
  );

  test(
    'should return InternetConnectionFaliure() when there is no internet',
    () async {
      //arrange
      when(mockSplashScreenRepo.autoLogin()).thenAnswer(
        (_) async => Left(InternetConnectionFaliure()),
      );
      //act
      final result = await autoLogin(NoParams());
      //assert
      //prefix0.expect(actual, matcher)
      expect(result, Left(InternetConnectionFaliure()));
      verify(mockSplashScreenRepo.autoLogin());
      verifyNoMoreInteractions(mockSplashScreenRepo);
    },
  );
}
