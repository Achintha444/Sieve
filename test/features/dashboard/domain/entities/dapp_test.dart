import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/dashboard/domain/entities/dapp.dart';

void main() {
  final String appName='test app1';
  final String iconImage='test icon1';
  final String categoryName='test category1';
  final int dCount=14;

  final Dapp tDapp = new Dapp(appName: appName, iconImage: iconImage,categoryName:categoryName,dCount:dCount);

  group('getAppName', () {
    test(
      'should return the desc',
          () async {
        //act
        final response = tDapp.getAppName;
        //assert
        expect(response, appName);
      },
    );
  });

  group('getCategoryName', () {
    test(
      'should return the desc',
          () async {
        //act
        final response = tDapp.getCategoryName;
        //assert
        expect(response, categoryName);
      },
    );
  });

  group('getIconImage', () {
    test(
      'should return the desc',
          () async {
        //act
        final response = tDapp.getIconImage;
        //assert
        expect(response, iconImage);
      },
    );
  });

  group('getDCount', () {
    test(
      'should return the desc',
          () async {
        //act
        final response = tDapp.getDCount;
        //assert
        expect(response, dCount);
      },
    );
  });






}

