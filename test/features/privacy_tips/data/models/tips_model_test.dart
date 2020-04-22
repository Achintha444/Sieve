import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/privacy_tips/data/models/tips_model.dart';
import 'package:sieve_data_privacy_app/features/privacy_tips/domain/entities/tips.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tTipsModel = TipsModel(title: 'test tip1', desc: 'test desc1');
  final tTipsModel1 = TipsModel(title: 'test tip2', desc: 'test desc2');
  final List<TipsModel> tips = new List<TipsModel>();
  tips.add(tTipsModel);
  tips.add(tTipsModel1);

  test(
    'should be a subclass of Tips entity',
    () async {
      //assert
      expect(tTipsModel, isA<Tips>());
    },
  );

  group('fromJson', () {
    test(
      'should return PrivacyTipsModel when input a valid json object',
      () async {
        //arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixtureReader('privacy_tip_fixture.json'));
        //act
        final result = TipsModel.fromJson(jsonMap);
        //assert
        expect(result, tTipsModel);
      },
    );
  });

  group('fromJsonList', () {
    test(
      'should return List<PrivacyTipsModel> when input a valid json list object',
      () async {
        //arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixtureReader('privacy_tips_list_fixture.json'));
        //act
        final result = TipsModel.fromJsonList(jsonMap);
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
        final result = tTipsModel.toJson();
        //assert
        final expectedMap = {'title': 'test tip1', 'desc': 'test desc1'};
        expect(result, expectedMap);
      },
    );
  });
}
