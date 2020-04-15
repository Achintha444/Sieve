import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:sieve_data_privacy_app/core/Constants/key.dart';
import 'package:sieve_data_privacy_app/core/Entities/empty_entity.dart';
import 'package:sieve_data_privacy_app/features/signup_screen/data/datasources/signup_screen_remote_datasource.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  SignupScreenRemoteDataSourceImpl signupScreenRemoteDataSourceImpl;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = new MockHttpClient();
    signupScreenRemoteDataSourceImpl =
        new SignupScreenRemoteDataSourceImpl(httpClient: mockHttpClient);
  });

  void mockHttpClientResponse200() {
    when(mockHttpClient.post(any, body: anyNamed('body'))).thenAnswer(
        (_) async => http.Response(
            fixtureReader('singup_user_sucess_fixture.json'), 200));
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

  group('getSignupUser', (){
    final email = "Test123@gmail.com";
    final password = "Test@123";

    test(
      'should perform a POST request on the /user/signup',
      () async {
        //arrange
        mockHttpClientResponse200();
        //act
        signupScreenRemoteDataSourceImpl.getSignupUser(email, password);
        //assert
        verify(mockHttpClient.post(API_URL + "/user/signup",
            body: {'email': email, 'password': password}));
      },
    );

    test(
      'should return EmptyEntity when the response code is 200',
      () async {
        //arrange
        mockHttpClientResponse200();
        //act
        final result = await signupScreenRemoteDataSourceImpl.getSignupUser(email, password);
        //assert
        expect(result, EmptyEntity());
      },
    );

    test(
      'should return InvalidInputFaliure when the response code is 404 and serverError is false',
      () async {
        //arrange
        mockHttpClientResponse404ServerErrorFalse();
        //act
        final call = signupScreenRemoteDataSourceImpl.getSignupUser;
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
        final call = signupScreenRemoteDataSourceImpl.getSignupUser;
        expect(() => call(email, password), throwsException);
        //assert
      },
    );
  
  });
}
