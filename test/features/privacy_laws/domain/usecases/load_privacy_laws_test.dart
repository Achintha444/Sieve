import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/privacy_laws/domain/entities/laws.dart';
import 'package:sieve_data_privacy_app/features/privacy_laws/domain/repos/privacy_laws_repo.dart';
import 'package:sieve_data_privacy_app/features/privacy_laws/domain/usecases/load_privacy_laws.dart';

class MockPrivacyLawsRepo extends Mock implements PrivacyLawsRepo {}

void main() {
  MockPrivacyLawsRepo mockPrivacyLawsRepo;
  LoadPrivacyLaws loadPrivacyLaws;

  setUp(() {
    mockPrivacyLawsRepo = new MockPrivacyLawsRepo();
    loadPrivacyLaws = new LoadPrivacyLaws(privacyLawsRepo: mockPrivacyLawsRepo);
  });

  final String _id = '1';
  final String _email = 'test@gmail.com';
  final String _password = 'Test@123';
  final LoginUser loginUser =
      new LoginUser(id: _id, email: _email, password: _password);
  final List<Laws> laws = new List<Laws>();

  test(
    'should return List<Law> when successful',
    () async {
      //arrange
      when(mockPrivacyLawsRepo.loadPrivacyLaws(loginUser))
          .thenAnswer((_) async => Right(laws));
      //act
      final results = await loadPrivacyLaws(loginUser);
      //assert
      expect(results, Right(laws));
      verify(mockPrivacyLawsRepo.loadPrivacyLaws(loginUser));
      verifyNoMoreInteractions(mockPrivacyLawsRepo);
    },
  );

  test(
    'should return ServerFaliure when unsuccessful',
    () async {
      //arrange
      when(mockPrivacyLawsRepo.loadPrivacyLaws(loginUser))
          .thenAnswer((_) async => Left(ServerFaliure()));
      //act
      final results = await loadPrivacyLaws(loginUser);
      //assert
      expect(results, Left(ServerFaliure()));
      verify(mockPrivacyLawsRepo.loadPrivacyLaws(loginUser));
      verifyNoMoreInteractions(mockPrivacyLawsRepo);
    },
  );

    test(
    'should return InternetConnectionFaliure when unsuccessful',
    () async {
      //arrange
      when(mockPrivacyLawsRepo.loadPrivacyLaws(loginUser))
          .thenAnswer((_) async => Left(InternetConnectionFaliure()));
      //act
      final results = await loadPrivacyLaws(loginUser);
      //assert
      expect(results, Left(InternetConnectionFaliure()));
      verify(mockPrivacyLawsRepo.loadPrivacyLaws(loginUser));
      verifyNoMoreInteractions(mockPrivacyLawsRepo);
    },
  );
}
