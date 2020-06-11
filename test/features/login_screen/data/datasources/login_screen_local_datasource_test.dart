import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sieve_data_privacy_app/core/Constants/key.dart';
import 'package:sieve_data_privacy_app/features/login_screen/data/datasources/login_screen_local_datasource.dart';
import 'package:sieve_data_privacy_app/features/login_screen/data/models/login_user_model.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  LoginScreenLocalDataSourceImpl localDataSourceImpl;
  MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSharedPreferences = new MockSharedPreferences();
    localDataSourceImpl = new LoginScreenLocalDataSourceImpl(
        sharedPreferences: mockSharedPreferences);
  });

  group('cacheLoginUser()', () {
    final tLoginUserModel = LoginUserModel(
        id: '1',
        email: 'test@gmail.com',
        password: 'Test@123',
        imageUrl: 'www.google.com',
        uid: '1');

    test(
      'should call SharedPreferences to cache the data',
      () async {
        //act
        localDataSourceImpl.cacheLoginUser(tLoginUserModel);
        //assert
        verify(mockSharedPreferences.setString(
            AUTO_LOGIN_USER_KEY, json.encode(tLoginUserModel.toJson())));
      },
    );
  });

  group('cacheGoogle()', () {
    test(
      'should call SharedPreferences to cache the data',
      () async {
        //act
        localDataSourceImpl.cacheGoogle();
        //assert
        verify(mockSharedPreferences.setString(LOGIN_TYPE, "Google"));
      },
    );
  });

  group('cacheFacebook()', () {
    test(
      'should call SharedPreferences to cache the data',
      () async {
        //act
        localDataSourceImpl.cacheFacebook();
        //assert
        verify(mockSharedPreferences.setString(LOGIN_TYPE, "Facebook"));
      },
    );
  });

  group('removeCacheLoginUser()', () {
    test(
      'should call SharedPreferences to remove the data',
      () async {
        //act
        localDataSourceImpl.removeCacheLoginUser();
        //assert
        verify(mockSharedPreferences.remove(AUTO_LOGIN_USER_KEY));
      },
    );
  });

  group('removeCacheLoginType()', () {
    test(
      'should call SharedPreferences to remove the data',
      () async {
        //act
        localDataSourceImpl.removeCacheLoginType();
        //assert
        verify(mockSharedPreferences.remove(LOGIN_TYPE));
      },
    );
  });

  group('getLoggedinType()', () {
    test(
      'should call SharedPreferences to remove the data',
      () async {
        //act
        var result = localDataSourceImpl.getLoggedinType();
        //assert
        verify(mockSharedPreferences.getString(LOGIN_TYPE));
        expect(result, mockSharedPreferences.getString(LOGIN_TYPE));
      },
    );
  });

}
