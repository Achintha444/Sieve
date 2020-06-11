import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:sieve_data_privacy_app/core/Constants/key.dart';
import 'package:sieve_data_privacy_app/core/Entities/empty_entity.dart';
import 'package:sieve_data_privacy_app/features/login_screen/data/models/login_user_model.dart';
import 'package:sieve_data_privacy_app/features/suggestion/data/datasources/suggestion_remote_datasource.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  SuggestionRemoteDataSourceImpl remoteDataSourceImpl;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = new MockHttpClient();
    remoteDataSourceImpl =
        new SuggestionRemoteDataSourceImpl(httpClient: mockHttpClient);
  });

  void mockHttpClientResponse200() {
    when(mockHttpClient.post(any, body: anyNamed('body')))
        .thenAnswer((_) async => http.Response('{"success":true}', 200));
  }

  void mockHttpClientResponse404ServerErrorTrue() {
    when(mockHttpClient.post(any, body: anyNamed('body'))).thenAnswer(
        (_) async => http.Response(
            fixtureReader('login_user_server_error_true.json'), 404));
  }

  group('insertSuggestion', () {
    final String id = '1';
    final String suggestion = 'Suggestion';
    final tLoginUserModel = LoginUserModel.fromJson(
        json.decode(fixtureReader('login_user_fixture.json')));
    test(
      'should perform a POST request on the /suggestion/insert',
      () async {
        //arrange
        mockHttpClientResponse200();
        //act
        remoteDataSourceImpl.insertSuggestion(tLoginUserModel, suggestion);
        //assert
        verify(mockHttpClient.post(API_URL + "/suggestion/insert",
            body: {'userId': id, 'suggestion': suggestion}));
      },
    );

    test(
      'should return EmptyEntity when the respose code is 200',
      () async {
        //arrange
        mockHttpClientResponse200();
        //act
        final result = await remoteDataSourceImpl.insertSuggestion(
            tLoginUserModel, suggestion);
        //assert
        expect(result, EmptyEntity());
      },
    );

    test(
      'should return ServerFaliure when the response code is 404 and serverError is true',
      () async {
        //arrange
        mockHttpClientResponse404ServerErrorTrue();
        //act
        final call = remoteDataSourceImpl.insertSuggestion;
        expect(() => call(tLoginUserModel, suggestion), throwsException);
        //assert
      },
    );
  });
}
