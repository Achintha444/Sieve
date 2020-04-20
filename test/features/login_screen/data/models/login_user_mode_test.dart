import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/login_screen/data/models/login_user_model.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tLoginUserModel =
      LoginUserModel(id: '1', email: 'test@gmail.com', password: 'Test"123');

  test(
    'should be a subclass of Numbertriva entity',
    () async {
      //assert
      expect(tLoginUserModel, isA<LoginUser>());
    },
  );

  group('fromJson', () {
    test(
      'should return LoginUserModel when input a valid json object',
      () async {
        //arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixtureReader('login_user_fixture.json'));
        //act

        //assert
      },
    );
  });

  group('toJson()', () {
    test(
      'should return a JSON map containinf the proper data',
      () async {
        //act
        final result = tLoginUserModel.toJson();
        //assert
        final expectedMap = {
          'id': '1',
          'email': 'test@gmail.com',
          'password': 'Test"123',
        };
        expect(result, expectedMap);
      },
    );
  });
}
