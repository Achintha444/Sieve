import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:sieve_data_privacy_app/core/Constants/key.dart';
import 'package:sieve_data_privacy_app/features/login_screen/data/datasources/login_screen_remote_datasource.dart';
import 'package:sieve_data_privacy_app/features/login_screen/data/models/login_user_model.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  LoginScreenRemoteDataSourceImpl remoteDataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = new MockHttpClient();
    remoteDataSource =
        new LoginScreenRemoteDataSourceImpl(httpClient: mockHttpClient);
  });

  void mockHttpClientResponse200() {
    when(mockHttpClient.post(any, body: anyNamed('body'))).thenAnswer(
        (_) async =>
            http.Response(fixtureReader('login_user_fixture.json'), 200));
  }

  void mockHttpClientResponse404ServerErrorFalse() {
    when(mockHttpClient.post(any, body: anyNamed('body'))).thenAnswer(
        (_) async => http.Response(
            fixtureReader('login_user_server_error_false.json'), 404));
  }

  void mockHttpClientResponse404ServerErrorTrue() {
    when(mockHttpClient.post(any, body: anyNamed('body'))).thenAnswer(
        (_) async => http.Response(
            fixtureReader('login_user_server_error_true.json'), 404));
  }

  void mockHttpClientResponse404BlockedErrorTrue() {
    when(mockHttpClient.post(any, body: anyNamed('body'))).thenAnswer(
        (_) async => http.Response(
            fixtureReader('login_user_blocked_error_true.json'), 404));
  }

  group('getLoginUser', () {
    final email = "Test123@gmail.com";
    final password = "Test@123";
    final tLoginUserModel = LoginUserModel.fromJson(
        json.decode(fixtureReader('login_user_fixture.json')));

    test(
      'should perform a POST request on the /user/login',
      () async {
        print(fixtureReader('login_user_fixture.json'));
        //arrange
        mockHttpClientResponse200();
        //act
        remoteDataSource.getLoginUser(email, password);
        //assert
        verify(mockHttpClient.post(API_URL + "/user/login",
            body: {'email': email, 'password': password}));
      },
    );

    test(
      'should return LoginUserModel when the response code is 200',
      () async {
        //arrange
        mockHttpClientResponse200();
        //act
        final result = await remoteDataSource.getLoginUser(email, password);
        //assert
        expect(result, tLoginUserModel);
      },
    );

    test(
      'should return InvalidInputFaliure when the response code is 404 and serverError is false',
      () async {
        //arrange
        mockHttpClientResponse404ServerErrorFalse();
        //act
        final call = remoteDataSource.getLoginUser;
        expect(() => call(email, password), throwsException);
        //assert
      },
    );

    test(
      'should return InvalidInputFaliure when the response code is 404 and serverError is false',
      () async {
        //arrange
        mockHttpClientResponse404BlockedErrorTrue();
        //act
        final call = remoteDataSource.getLoginUser;
        expect(() => call(email, password), throwsException);
        //assert
      },
    );

    test(
      'should return ServerFaliure when the response code is 404 and serverError is true',
      () async {
        //arrange
        mockHttpClientResponse404ServerErrorTrue();
        //act
        final call = remoteDataSource.getLoginUser;
        expect(() => call(email, password), throwsException);
        //assert
      },
    );
  });
}
