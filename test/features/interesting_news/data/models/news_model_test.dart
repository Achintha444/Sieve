import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/interesting_news/data/models/news_model.dart';
import 'package:sieve_data_privacy_app/features/interesting_news/domain/entities/news.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tNewsModel = NewsModel(title: 'test news1', desc: 'test desc1',fullLink: 'test link1');
  final tNewsModel1 = NewsModel(title: 'test news2', desc: 'test desc2',fullLink: 'test link2');
  final List<NewsModel> news = new List<NewsModel>();
  news.add(tNewsModel);
  news.add(tNewsModel1);

  test(
    'should be a subclass of News entity',
        () async {
      //assert
      expect(tNewsModel, isA<News>());
    },
  );

  group('fromJson', () {
    test(
      'should return InterestingNewsModel when input a valid json object',
          () async {
        //arrange
        final Map<String, dynamic> jsonMap =
        json.decode(fixtureReader('interesting_news_fixture.json'));
        //act
        final result = NewsModel.fromJson(jsonMap);
        //assert
        expect(result, tNewsModel);
      },
    );
  });

  group('fromJsonList', () {
    test(
      'should return List<InterestingNewsModel> when input a valid json list object',
          () async {
        //arrange
        final Map<String, dynamic> jsonMap =
        json.decode(fixtureReader('interesting_news_list_fixture.json'));
        //act
        final result = NewsModel.fromJsonList(jsonMap);
        //assert
        expect(result, news);
      },
    );
  });

  group('toJson()', () {
    test(
      'should return a JSON map containinf the proper data',
          () async {
        //act
        final result = tNewsModel.toJson();
        //assert
        final expectedMap = {'title': 'test news1', 'desc': 'test desc1','full_link': 'test link1'};
        expect(result, expectedMap);
      },
    );
  });
}
