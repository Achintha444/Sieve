import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/domain/entities/privacy_policy.dart';

void main() {
  final List<String> types = ['ip address', 'dob', 'email'];
  final List<String> usages = [
    'Providing services and features',
    'Providing services and features'
  ];
  final List<String> removal = [
    'Providing services and features',
    'Providing services and features'
  ];
  final String contactLink = 'www.google.com';
  final String email = 'test@gmail.com';
  final String fiLine = 'fiLine';
  final String sLine = 'sLine';
  final String tLine = 'tLine';
  final String foLine = 'foLine';

  final tPrivacyPolicy = new PrivacyPolicy(
      types: types,
      usages: usages,
      removal: removal,
      contactLink: contactLink,
      email: email,
      fiLine: fiLine,
      sLine: sLine,
      tLine: tLine,
      foLine: foLine);

  group('getTypes', () {
    test(
      'should return the types',
      () async {
        //act
        final response = tPrivacyPolicy.getTypes;
        //assert
        expect(response, types);
      },
    );
  });

  group('getUsages', () {
    test(
      'should return the usages',
      () async {
        //act
        final response = tPrivacyPolicy.getUsages;
        //assert
        expect(response, usages);
      },
    );
  });

  group('getRemoval', () {
    test(
      'should return the removal',
      () async {
        //act
        final response = tPrivacyPolicy.getRemoval;
        //assert
        expect(response, removal);
      },
    );
  });

  group('getContactLink', () {
    test(
      'should return the ContactLink',
      () async {
        //act
        final response = tPrivacyPolicy.getContactLink;
        //assert
        expect(response, contactLink);
      },
    );
  });

  group('getEmail', () {
    test(
      'should return the Email',
      () async {
        //act
        final response = tPrivacyPolicy.getEmail;
        //assert
        expect(response, email);
      },
    );
  });

  group('getFiLine', () {
    test(
      'should return the FiLine',
      () async {
        //act
        final response = tPrivacyPolicy.getFiLine;
        //assert
        expect(response, fiLine);
      },
    );
  });

  group('getSLine', () {
    test(
      'should return the SLine',
      () async {
        //act
        final response = tPrivacyPolicy.getSLine;
        //assert
        expect(response, sLine);
      },
    );
  });

  group('getTLine', () {
    test(
      'should return the TLine',
      () async {
        //act
        final response = tPrivacyPolicy.getTLine;
        //assert
        expect(response, tLine);
      },
    );
  });

  group('getFoLine', () {
    test(
      'should return the FoLine',
      () async {
        //act
        final response = tPrivacyPolicy.getFoLine;
        //assert
        expect(response, foLine);
      },
    );
  });
}
