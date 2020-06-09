import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/Constants/key.dart';
import 'package:sieve_data_privacy_app/features/categories/data/datasources/categories_remote_datasource.dart';
import 'package:sieve_data_privacy_app/features/categories/data/models/categories_model.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  MockHttpClient mockHttpClient;
  CategoriesRemoteDatasourceImpl remoteDatasource;

  setUp(() {
    mockHttpClient = new MockHttpClient();
    remoteDatasource =
    new CategoriesRemoteDatasourceImpl(httpClient: mockHttpClient);
  });

  void mockHttpClientResponse200() {
    when(mockHttpClient.post(any)).thenAnswer((_) async =>
        http.Response(fixtureReader('categories_list_fixture.json'), 200));
  }

  void mockHttpClientResponse404ServerErrorTrue() {
    when(mockHttpClient.post(any)).thenAnswer((_) async =>
        http.Response(fixtureReader('login_user_server_error_true.json'), 404));
  }

  final List<CategoriesModel> tLawsModel = CategoriesModel.fromJsonList(
      json.decode(fixtureReader('categories_list_fixture.json')));

  test(
    'should perform the POST request on /categories/view_all',
        () async {
      //arrange
      mockHttpClientResponse200();
      //act
      final result = await remoteDatasource.loadCategories();
      //assert
      verify(mockHttpClient.post(API_URL + "/categories/view_all"));
      expect(result, tLawsModel);
    },
  );

  test(
    'should return ServerFaliure when the response code is 404 and serverError is true',
        () async {
      //arrange
      mockHttpClientResponse404ServerErrorTrue();
      //act
      final call = remoteDatasource.loadCategories;
      expect(() => call(), throwsException);
      //assert
    },
  );
}
