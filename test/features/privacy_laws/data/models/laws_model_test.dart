import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/privacy_laws/data/models/laws_model.dart';
import 'package:sieve_data_privacy_app/features/privacy_laws/domain/entities/laws.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tLawsModel = LawsModel(
      law: 'test law1', fullLink: 'www.test1.com', desc: 'test desc1');
  final tLawsModel1 = LawsModel(
      law: 'test law2', fullLink: 'www.test2.com', desc: 'test desc2');
  final List<LawsModel> laws = new List<LawsModel>();
  laws.add(tLawsModel);
  laws.add(tLawsModel1);

  test(
    'should be a subclass of Laws entity',
    () async {
      //assert
      expect(tLawsModel, isA<Laws>());
    },
  );

  group('fromJson', () {
    test(
      'should return PrivacyLawsModel when input a valid json object',
      () async {
        //arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixtureReader('privacy_law_fixture.json'));
        //act
        final result = LawsModel.fromJson(jsonMap);
        //assert
        expect(result, tLawsModel);
      },
    );
  });

  group('fromJsonList', () {
    test(
      'should return List<PrivacyLawsModel> when input a valid json list object',
      () async {
        //arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixtureReader('privacy_laws_list_fixture.json'));
        //act
        final result = LawsModel.fromJsonList(jsonMap);
        //assert
        expect(result, laws);
      },
    );
  });

  group('toJson()', () {
    test(
      'should return a JSON map containinf the proper data',
      () async {
        //act
        final result = tLawsModel.toJson();
        //assert
        final expectedMap = {
          "law": "test law1",
          "fullLink": "www.test1.com",
          "desc": "test desc1"
        };
        expect(result, expectedMap);
      },
    );
  });
}
