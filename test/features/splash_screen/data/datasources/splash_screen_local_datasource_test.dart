import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sieve_data_privacy_app/core/Constants/key.dart';
import 'package:sieve_data_privacy_app/features/login_screen/data/models/login_user_model.dart';
import 'package:sieve_data_privacy_app/features/splash_screen/data/datasources/splash_screen_local_datasource.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

main() {
  SplashScreenLocalDataSourceImpl localDataSource;
  MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = new MockSharedPreferences();
    localDataSource = new SplashScreenLocalDataSourceImpl(
        sharedPreferences: mockSharedPreferences);
  });

  group('autoLogin()', () {
    final tLoginUserModel = LoginUserModel.fromJson(
        json.decode(fixtureReader('login_user_fixture.json')));

    test(
      'should return NumberTivia from SharedPreferences when there is one in the cache',
      () async {
        //arrange
        when(mockSharedPreferences.getString(any))
            .thenReturn(fixtureReader('login_user_fixture.json'));
        //act
        final result = await localDataSource.autoLogin();
        //assert
        verify(mockSharedPreferences.getString(AUTO_LOGIN_USER_KEY));
        expect(result, tLoginUserModel);
      },
    );

    test(
      'should return A CacheExpection when there is not a cached value',
      () async {
        //arrange
        when(mockSharedPreferences.getString(any)).thenReturn(null);
        //act
        final call = localDataSource.autoLogin;
        //assert
        // verify(mockSharedPreferences.getString(CACHED_NUMBER_TRIVIA));
        //expect(() => call, throwsA(TypeMatcher<CacheException>()));
        expect(() => call(), throwsException);
      },
    );
  });
}
