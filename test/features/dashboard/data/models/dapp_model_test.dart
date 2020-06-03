import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/dashboard/data/models/dapp_model.dart';
import 'package:sieve_data_privacy_app/features/dashboard/domain/entities/dapp.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tDappModel = DappModel(
      appName: 'UBER',
      iconImage:
          'https://seeklogo.com/images/U/uber-logo-2BB8EC4342-seeklogo.com.png',
      categoryName: "Transport",
      dCount: 10);
  final tDappModel1 = DappModel(
      appName: 'Pick Me',
      iconImage:
          'https://upload.wikimedia.org/wikipedia/commons/0/0c/PickMe_SriLanka_Logo.png',
      categoryName: "Transport",
      dCount: 15);
  final List<DappModel> tips = new List<DappModel>();
  tips.add(tDappModel);
  tips.add(tDappModel1);

  test(
    'should be a subclass of Dapp entity',
    () async {
      //assert
      expect(tDappModel, isA<Dapp>());
    },
  );

  group('fromJson', () {
    test(
      'should return DappModel when input a valid json object',
      () async {
        //arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixtureReader('dashboard_fixture.json'));
        //act
        final result = DappModel.fromJson(jsonMap);
        //assert
        expect(result, tDappModel);
      },
    );
  });

  group('fromJsonList', () {
    test(
      'should return List<DappModel> when input a valid json list object',
      () async {
        //arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixtureReader('dashboard_list_fixture.json'));
        //act
        final result = DappModel.fromJsonList(jsonMap);
        //assert
        expect(result, tips);
      },
    );
  });

  group('toJson()', () {
    test(
      'should return a JSON map containinf the proper data',
      () async {
        //act
        final result = tDappModel.toJson();
        //assert
        final expectedMap = {
          "appName": "UBER",
          "iconImage":
              "https://seeklogo.com/images/U/uber-logo-2BB8EC4342-seeklogo.com.png",
          "categoryName": "Transport",
          "dCount": 10
        };
        expect(result, expectedMap);
      },
    );
  });
}
