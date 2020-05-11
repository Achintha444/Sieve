import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/domain/entities/privacy_policy.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/domain/repos/privacy_policy_repo.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/domain/usecases/get_privacy_policy.dart';

class MockPrivacyPolicyRepo extends Mock implements PrivacyPolicyRepo {}

void main() {
  MockPrivacyPolicyRepo mockPrivacyPolicyRepo;
  GetPriacyPolicy getPriacyPolicy;

  setUp(() {
    mockPrivacyPolicyRepo = new MockPrivacyPolicyRepo();
    getPriacyPolicy =
        new GetPriacyPolicy(privacyPolicyRepo: mockPrivacyPolicyRepo);
  });

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

  final String _id = '1';
  final String _email = 'test@gmail.com';
  final String _password = 'Test@123';
  final LoginUser loginUser =
      new LoginUser(id: _id, email: _email, password: _password);

  test(
    'should return PrivacyPolicy() when operates correctly',
    () async {
      //arrange
      when(mockPrivacyPolicyRepo.getPrivacyPolicy(any, any))
          .thenAnswer((_) async => Right(tPrivacyPolicy));
      //act
      final result = await getPriacyPolicy([_id, loginUser]);
      //assert
      expect(result, Right(tPrivacyPolicy));
      verify(mockPrivacyPolicyRepo.getPrivacyPolicy(_id, loginUser));
      verifyNoMoreInteractions(mockPrivacyPolicyRepo);
    },
  );

  test(
    'should return InternetConnectionFaliure() when there is no internet connection',
    () async {
      //arrange
      when(mockPrivacyPolicyRepo.getPrivacyPolicy(any, any))
          .thenAnswer((_) async => Left(InternetConnectionFaliure()));
      //act
      final result = await getPriacyPolicy([_id, loginUser]);
      //assert
      expect(result, Left(InternetConnectionFaliure()));
      verify(mockPrivacyPolicyRepo.getPrivacyPolicy(_id, loginUser));
      verifyNoMoreInteractions(mockPrivacyPolicyRepo);
    },
  );

    test(
    'should return ServerFaliure() when there is no internet connection',
    () async {
      //arrange
      when(mockPrivacyPolicyRepo.getPrivacyPolicy(any, any))
          .thenAnswer((_) async => Left(ServerFaliure()));
      //act
      final result = await getPriacyPolicy([_id, loginUser]);
      //assert
      expect(result, Left(ServerFaliure()));
      verify(mockPrivacyPolicyRepo.getPrivacyPolicy(_id, loginUser));
      verifyNoMoreInteractions(mockPrivacyPolicyRepo);
    },
  );
}
