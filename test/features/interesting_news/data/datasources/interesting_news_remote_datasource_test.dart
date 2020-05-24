import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/Constants/key.dart';

import 'package:sieve_data_privacy_app/features/interesting_news/data/datasources/interesting_news_remote_datasource.dart';
import 'package:sieve_data_privacy_app/features/interesting_news/data/models/news_model.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  MockHttpClient mockHttpClient;
  InterestingNewsRemoteDatasourceImpl  remoteDatasource;

  setUp(() {
    mockHttpClient = new MockHttpClient();
    remoteDatasource =
    new InterestingNewsRemoteDatasourceImpl(httpClient: mockHttpClient);
  });

  void mockHttpClientResponse200() {
    when(mockHttpClient.post(any)).thenAnswer((_) async =>
        http.Response(fixtureReader('interesting_news_list_fixture.json'), 200));
  }

  void mockHttpClientResponse404ServerErrorTrue() {
    when(mockHttpClient.post(any)).thenAnswer((_) async =>
        http.Response(fixtureReader('login_user_server_error_true.json'), 404));
  }

  final List<NewsModel> tNewsModel = NewsModel.fromJsonList(
      json.decode(fixtureReader('interesting_news_list_fixture.json')));

  test(
    'should perform the POST request on /interesting_news/view_all',
        () async {
      //arrange
      mockHttpClientResponse200();
      //act
      final result = await remoteDatasource.loadInterestingNews();
      //assert
      verify(mockHttpClient.post(API_URL + "/interesting_news/view_all"));
      expect(result, tNewsModel);
    },
  );

  test(
    'should return ServerFaliure when the response code is 404 and serverError is true',
        () async {
      //arrange
      mockHttpClientResponse404ServerErrorTrue();
      //act
      final call = remoteDatasource.loadInterestingNews;
      expect(() => call(), throwsException);
      //assert
    },
  );
}
