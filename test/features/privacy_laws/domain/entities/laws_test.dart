import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/privacy_laws/domain/entities/laws.dart';

void main() {
  final String law = 'Law';
  final String fullLink = 'www.test.com';
  final String desc = 'desc';

  final Laws tLaw = new Laws(law: law, fullLink: fullLink, desc: desc);

  group('getLaw', () {
    test(
      'should return the law',
      () async {
        //act
        final response = tLaw.getLaw;
        //assert
        expect(response, law);
      },
    );
  });

  group('getFullLink', () {
    test(
      'should return the full link',
      () async {
        //act
        final response = tLaw.getFullLink;
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
        final response = tLaw.getDesc;
        //assert
        expect(response, desc);
      },
    );
  });
}
