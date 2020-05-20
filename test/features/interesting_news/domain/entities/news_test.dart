import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/interesting_news//domain/entities/news.dart';

void main() {
  final String title = 'Law';
  final String desc = 'desc';
  final String fullLink = 'www.test.com';


  final News tNews = new News(title: title, fullLink: fullLink, desc: desc);

  group('getTitle', () {
    test(
      'should return the Title',
          () async {
        //act
        final response = tNews.getTitle;
        //assert
        expect(response, title);
      },
    );
  });

  group('getFullLink', () {
    test(
      'should return the full link',
          () async {
        //act
        final response = tNews.getFullLink;
        //assert
        expect(response, response);
      },
    );
  });

  group('getDesc', () {
    test(
      'should return the desc',
          () async {
        //act
        final response = tNews.getDesc;
        //assert
        expect(response, desc);
      },
    );
  });
}