import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/categories/data/models/apps_model.dart';
import 'package:sieve_data_privacy_app/features/categories/domain/entities/apps.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tAppsModel1 = AppsModel(
      id: 1, name: 'app 1', desc: "desc 1", icon: 'www.icon1.com', bg: "www.bg1.com", link: "www.link1.com");
  final tAppsModel2 = AppsModel(
      id: 2, name: 'app 2', desc: "desc 2", icon: 'www.icon2.com', bg: "www.bg2.com", link: "www.link2.com");
  final List<AppsModel> apps = new List<AppsModel>();
  apps.add(tAppsModel1);
  apps.add(tAppsModel2);

  test(
    'should be a subclass of Laws entity',
        () async {
      //assert
      expect(tAppsModel1, isA<App>());
    },
  );

  group('fromJson', () {
    test(
      'should return AppsModel when input a valid json object',
          () async {
        //arrange
        final Map<String, dynamic> jsonMap =
        json.decode(fixtureReader('apps_fixture.json'));
        //act
        final result = AppsModel.fromJson(jsonMap);
        //assert
        expect(result, tAppsModel1);
      },
    );
  });

  group('fromJsonList', () {
    test(
      'should return List<AppsModel> when input a valid json list object',
          () async {
        //arrange
        final Map<String, dynamic> jsonMap =
        json.decode(fixtureReader('apps_list_fixture.json'));
        //act
        final result = AppsModel.fromJsonList(jsonMap);
        //assert
        expect(result, apps);
      },
    );
  });

  group('toJson()', () {
    test(
      'should return a JSON map containing the proper data',
          () async {
        //act
        final result = tAppsModel1.toJson();
        //assert
        final expectedMap = {
          'apps_id': 1,
          'apps_name': "app 1",
          'description': "desc 1",
          'icon_image': "www.icon1.com",
          'background_image': "www.bg1.com",
          'privacy_policy_link': "www.link1.com"
        };
        expect(result, expectedMap);
      },
    );
  });
}
