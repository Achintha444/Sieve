import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/categories/data/models/categories_model.dart';
import 'package:sieve_data_privacy_app/features/categories/domain/entities/categories.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tCategoriesModel1 = CategoriesModel(
      id: 1, name: 'category 1', icon: 'e2bc');
  final tCategoriesModel2 = CategoriesModel(
      id: 2, name: 'category 2', icon: 'e57a');
  final List<CategoriesModel> categories = new List<CategoriesModel>();
  categories.add(tCategoriesModel1);
  categories.add(tCategoriesModel2);

  test(
    'should be a subclass of Laws entity',
        () async {
      //assert
      expect(tCategoriesModel1, isA<Categories>());
    },
  );

  group('fromJson', () {
    test(
      'should return CategoriesModel when input a valid json object',
          () async {
        //arrange
        final Map<String, dynamic> jsonMap =
        json.decode(fixtureReader('categories_fixture.json'));
        //act
        final result = CategoriesModel.fromJson(jsonMap);
        //assert
        expect(result, tCategoriesModel1);
      },
    );
  });

  group('fromJsonList', () {
    test(
      'should return List<CategoriesModel> when input a valid json list object',
          () async {
        //arrange
        final Map<String, dynamic> jsonMap =
        json.decode(fixtureReader('categories_list_fixture.json'));
        //act
        final result = CategoriesModel.fromJsonList(jsonMap);
        //assert
        expect(result, categories);
      },
    );
  });

  group('toJson()', () {
    test(
      'should return a JSON map containing the proper data',
          () async {
        //act
        final result = tCategoriesModel1.toJson();
        //assert
        final expectedMap = {
          "category_id": 1,
          "category_name": "category 1",
          "icon_link": "e2bc"
        };
        expect(result, expectedMap);
      },
    );
  });
}
