import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/data/models/privacy_policy_model.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/domain/entities/privacy_policy.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tPrivacyPolicyModel = PrivacyPolicyModel(
      types: [
        "name",
        "email",
        "gender"
      ],
      usages: [
        "Location related information to provide,personalise and improve their product,including ads,for you and the others",
        "Network and connection information(people,pages,account,hashtags etc) may use to help others and you to find people you may know"
      ],
      removal: [
        "Data store until your account is deleted.",
        "But when  the account is deleted all posted information given by others about you is not deleted since it a part of your account.So they are not deleted "
      ],
      contactLink: "https://www.facebook.com/help/contact/861937627253138",
      email: "achinthaisuru444@gmail.com",
      fiLine: "Facebook,inc.ATTN:",
      sLine: "Privacy operation 1601",
      tLine: "Willow Road Menlo Park",
      foLine: "CA 94028,USA");

  test(
    'should be a subclass of Numbertriva entity',
    () async {
      //assert
      expect(tPrivacyPolicyModel, isA<PrivacyPolicy>());
    },
  );

  group('fromJson', () {
    test(
      'should return PrivacyPolicyModel when input a valid json object',
      () async {
        //arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixtureReader('privacy_policy_fixture.json'));
        //act
        final result = PrivacyPolicyModel.fromJson(jsonMap);
        //assert
        expect(result, tPrivacyPolicyModel);
      },
    );
  });

  group('toJson()', () {
    test(
      'should return a JSON map containinf the proper data',
      () async {
        //act
        final result = tPrivacyPolicyModel.toJson();
        //assert
        final expectedMap = {
          'types': ["name", "email", "gender"],
          'usages': [
            "Location related information to provide,personalise and improve their product,including ads,for you and the others",
            "Network and connection information(people,pages,account,hashtags etc) may use to help others and you to find people you may know"
          ],
          'removals': [
            "Data store until your account is deleted.",
            "But when  the account is deleted all posted information given by others about you is not deleted since it a part of your account.So they are not deleted "
          ],
          "contact_link":
              "https://www.facebook.com/help/contact/861937627253138",
          "email": "achinthaisuru444@gmail.com",
          'first_line': "Facebook,inc.ATTN:",
          'second_line': "Privacy operation 1601",
          'third_line': "Willow Road Menlo Park",
          'fourth_line': "CA 94028,USA"
        };
        expect(result, expectedMap);
      },
    );
  });
}
