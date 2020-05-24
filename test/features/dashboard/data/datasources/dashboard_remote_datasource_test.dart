import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/Constants/key.dart';

import 'package:sieve_data_privacy_app/features/dashboard/data/datasources/dashboard_remote_datasource.dart';
import 'package:sieve_data_privacy_app/features/dashboard/data/models/dapp_model.dart';

import '../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  MockHttpClient mockHttpClient;
  DashboardRemoteDatasourceImpl  remoteDatasource;

  setUp(() {
    mockHttpClient = new MockHttpClient();
    remoteDatasource =
    new DashboardRemoteDatasourceImpl(httpClient: mockHttpClient);
  });

  void mockHttpClientResponse200() {
    when(mockHttpClient.post(any)).thenAnswer((_) async =>
        http.Response(fixtureReader('dashboard_list_fixture.json'), 200));
  }

  void mockHttpClientResponse404ServerErrorTrue() {
    when(mockHttpClient.post(any)).thenAnswer((_) async =>
        http.Response(fixtureReader('login_user_server_error_true.json'), 404));
  }

  final List<DappModel> tDappModel = DappModel.fromJsonList(json.decode(fixtureReader('dashboard_list_fixture.json')));


  test(
    'should perform the POST request on /dashboard/view_all',
        () async {
      //arrange
      mockHttpClientResponse200();
      //act
      final result = await remoteDatasource.loadDashboard();
      //assert
      verify(mockHttpClient.post(API_URL + "/dashboard/view_all"));
      print(result);
      expect(result, tDappModel);
    },
  );

  test(
    'should return ServerFaliure when the response code is 404 and serverError is true',
        () async {
      //arrange
      mockHttpClientResponse404ServerErrorTrue();
      //act
      final call = remoteDatasource.loadDashboard;
      expect(() => call(), throwsException);
      //assert
    },
  );
}
