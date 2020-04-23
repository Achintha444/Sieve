import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/privacy_tips/domain/entities/Tips.dart';

void main() {
  final String title = 'Title';
  final String desc = 'desc';

  final Tips tTip = new Tips(title: title, desc: desc);

  group('getTitle', () {
    test(
      'should return the Tip',
      () async {
        //act
        final response = tTip.getTitle;
        //assert
        expect(response, title);
      },
    );
  });

  group('getDesc', () {
    test(
      'should return the desc',
      () async {
        //act
        final response = tTip.getDesc;
        //assert
        expect(response, desc);
      },
    );
  });
}
