import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/categories/domain/entities/categories.dart';

void main() {
  final int id = 1;
  final String name = "Category 1";
  final String icon = "e2bc";

  final Categories tCategory = new Categories(id: id, name: name, icon: icon);

  group('getID', () {
    test(
      'should return the id',
          () async {
        //act
        final response = tCategory.getID;
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
        final response = tCategory.getName;
        //assert
        expect(response, name);
      },
    );
  });

  group('getIcon', () {
    test(
      'should return the icon',
          () async {
        //act
        final response = tCategory.getIcon;
        //assert
        expect(response, icon);
      },
    );
  });
}
