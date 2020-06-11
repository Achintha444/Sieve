import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/categories/domain/entities/apps.dart';

void main() {
  final int id = 1;
  final String name = "App 1";
  final String desc = "Desc 1";
  final String icon = "www.icon1.com";
  final String bg = "www.bg1.com";
  final String link = "www.link1.com";

  final App tApp = new App(id: id, name: name, desc: desc, icon: icon, bg: bg, link: link);

  group('getID', () {
    test(
      'should return the id',
          () async {
        //act
        final response = tApp.getID;
        //assert
        expect(response, id);
      },
    );
  });

  group('getName', () {
    test(
      'should return the name',
          () async {
        //act
        final response = tApp.getName;
        //assert
        expect(response, name);
      },
    );
  });

  group('getDesc', () {
    test(
      'should return the desc',
          () async {
        //act
        final response = tApp.getDesc;
        //assert
        expect(response, desc);
      },
    );
  });

  group('getIcon', () {
    test(
      'should return the icon',
          () async {
        //act
        final response = tApp.getIcon;
        //assert
        expect(response, icon);
      },
    );
  });

  group('getBG', () {
    test(
      'should return the bg',
          () async {
        //act
        final response = tApp.getBG;
        //assert
        expect(response, bg);
      },
    );
  });

  group('getLink', () {
    test(
      'should return the link',
          () async {
        //act
        final response = tApp.getLink;
        //assert
        expect(response, link);
      },
    );
  });
}
