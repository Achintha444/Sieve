import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:sieve_data_privacy_app/core/Constants/key.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/data/datasources/privacy_policy_remote_datasource.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/data/models/privacy_policy_model.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  PrivacyPolicyRemoteDatasourceImpl remoteDataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = new MockHttpClient();
    remoteDataSource =
        new PrivacyPolicyRemoteDatasourceImpl(httpClient: mockHttpClient);
  });

  void mockHttpClientResponse200() {
    when(mockHttpClient.post(any, body: anyNamed('body'))).thenAnswer(
        (_) async =>
            http.Response(fixtureReader('privacy_policy_fixture.json'), 200));
  }

  void mockHttpClientResponse404ServerErrorTrue() {
    when(mockHttpClient.post(any, body: anyNamed('body'))).thenAnswer(
        (_) async => http.Response(
            fixtureReader('login_user_server_error_true.json'), 404));
  }

  group('loadPrivacyPolicy', () {
    final tPrivacyPolicyModel = PrivacyPolicyModel.fromJson(
        json.decode(fixtureReader('privacy_policy_fixture.json')));

    test(
      'should perform a POST request on the /privacy_policy/view_all',
      () async {
        print(fixtureReader('privacy_policy_fixture.json'));
        //arrange
        mockHttpClientResponse200();
        //act
        remoteDataSource.loadPrivacyPolicy('1');
        //assert
        verify(mockHttpClient
            .post(API_URL + "/privacy_policy/view_all", body: {'id': '1'}));
      },
    );

    test(
      'should return PrivacyPolicyModel when the response code is 200',
      () async {
        //arrange
        mockHttpClientResponse200();
        //act
        final result = await remoteDataSource.loadPrivacyPolicy('1');
        //assert
        expect(result, tPrivacyPolicyModel);
      },
    );

    test(
      'should return ServerFaliure when the response code is 404 and serverError is true',
      () async {
        //arrange
        mockHttpClientResponse404ServerErrorTrue();
        //act
        final call = remoteDataSource.loadPrivacyPolicy;
        expect(() => call('1'), throwsException);
        //assert
      },
    );
  });
}
