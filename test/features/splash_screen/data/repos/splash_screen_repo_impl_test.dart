import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/Entities/empty_entity.dart';
import 'package:sieve_data_privacy_app/core/error/exceptions.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/core/Platform/network_info.dart';
import 'package:sieve_data_privacy_app/features/login_screen/data/models/login_user_model.dart';
import 'package:sieve_data_privacy_app/features/splash_screen/data/datasources/splash_screen_local_datasource.dart';
import 'package:sieve_data_privacy_app/features/splash_screen/data/repos/splash_screen_repo_impl.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockSplashScreenLocalDataSource extends Mock
    implements SplashScreenLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  MockNetworkInfo mockNetworkInfo;
  MockSplashScreenLocalDataSource mockSplashScreenLocalDataSource;
  SplashScreenRepoImpl screenRepoImpl;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockSplashScreenLocalDataSource = new MockSplashScreenLocalDataSource();
    screenRepoImpl = SplashScreenRepoImpl(
        networkInfo: mockNetworkInfo,
        splashScreenLocalDataSource: mockSplashScreenLocalDataSource);
  });

  void groupTestOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  void groupTestOffline(Function body) {
    group('device is offline', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });

      body();
    });
  }

  group('navigateToLoginScreen', () {
    test(
      'should check if the device is online',
      () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        //act
        screenRepoImpl.navigateToLoginScreen();
        await untilCalled(mockNetworkInfo.isConnected);
        //assert
        //expect(response, true);
        verify(mockNetworkInfo.isConnected);
        verifyNoMoreInteractions(mockNetworkInfo);
      },
    );

    groupTestOnline(() {
      test(
        'should return EmptyEntity',
        () async {
          //act
          final response = await screenRepoImpl.navigateToLoginScreen();
          //assert
          expect(response, Right(EmptyEntity()));
        },
      );
    });

    groupTestOffline(() {
      test(
        'should return InternetConnectionFaliure',
        () async {
          //act
          final response = await screenRepoImpl.navigateToLoginScreen();
          //assert
          expect(response, Left(InternetConnectionFaliure()));
        },
      );
    });
  });

  group('autoLogin', () {
    final loginUserModel = LoginUserModel.fromJson(
        json.decode(fixtureReader('login_user_fixture.json')));

    test(
      'should check if the device is online',
      () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        //act
        screenRepoImpl.autoLogin();
        await untilCalled(mockNetworkInfo.isConnected);
        //assert
        //expect(response, true);
        verify(mockNetworkInfo.isConnected);
        verifyNoMoreInteractions(mockNetworkInfo);
      },
    );

    groupTestOnline(() {
      test(
        'should return LoginUserModel',
        () async {
          when(mockSplashScreenLocalDataSource.autoLogin())
              .thenAnswer((_) async => loginUserModel);
          //act
          final response = await screenRepoImpl.autoLogin();
          //assert
          expect(response, Right(loginUserModel));
        },
      );

      test(
        'should return CacheFaliure in CacheException',
        () async {
          when(mockSplashScreenLocalDataSource.autoLogin())
              .thenThrow(CacheException());
          //act
          final response = await screenRepoImpl.autoLogin();
          //assert
          expect(response, Left(CacheFaliure()));
        },
      );
    });

    groupTestOffline(() {
      test(
        'should return InternetConnectionFaliure',
        () async {
          //act
          final response = await screenRepoImpl.autoLogin();
          //assert
          expect(response, Left(InternetConnectionFaliure()));
        },
      );
    });
  });
}
