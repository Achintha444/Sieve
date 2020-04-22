import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/privacy_tips/domain/entities/tips.dart';
import 'package:sieve_data_privacy_app/features/privacy_tips/domain/repos/privacy_tips_repo.dart';
import 'package:sieve_data_privacy_app/features/privacy_tips/domain/usecases/load_privacy_tips.dart';

class MockPrivacyTipsRepo extends Mock implements PrivacyTipsRepo {}

void main() {
  MockPrivacyTipsRepo mockPrivacyTipsRepo;
  LoadPriavacyTips loadPrivacyTips;

  setUp(() {
    mockPrivacyTipsRepo = new MockPrivacyTipsRepo();
    loadPrivacyTips =
        new LoadPriavacyTips(privacyTipsRepo: mockPrivacyTipsRepo);
  });

  final String _id = '1';
  final String _email = 'test@gmail.com';
  final String _password = 'Test@123';
  final LoginUser loginUser =
      new LoginUser(id: _id, email: _email, password: _password);
  final List<Tips> tips = new List<Tips>();

  test(
    'should return List<Law> when successful',
    () async {
      //arrange
      when(mockPrivacyTipsRepo.loadPrivacyTips(loginUser))
          .thenAnswer((_) async => Right(tips));
      //act
      final results = await loadPrivacyTips(loginUser);
      //assert
      expect(results, Right(tips));
      verify(mockPrivacyTipsRepo.loadPrivacyTips(loginUser));
      verifyNoMoreInteractions(mockPrivacyTipsRepo);
    },
  );

  test(
    'should return ServerFaliure when unsuccessful',
    () async {
      //arrange
      when(mockPrivacyTipsRepo.loadPrivacyTips(loginUser))
          .thenAnswer((_) async => Left(ServerFaliure()));
      //act
      final results = await loadPrivacyTips(loginUser);
      //assert
      expect(results, Left(ServerFaliure()));
      verify(mockPrivacyTipsRepo.loadPrivacyTips(loginUser));
      verifyNoMoreInteractions(mockPrivacyTipsRepo);
    },
  );

  test(
    'should return InternetConnectionFaliure when unsuccessful',
    () async {
      //arrange
      when(mockPrivacyTipsRepo.loadPrivacyTips(loginUser))
          .thenAnswer((_) async => Left(InternetConnectionFaliure()));
      //act
      final results = await loadPrivacyTips(loginUser);
      //assert
      expect(results, Left(InternetConnectionFaliure()));
      verify(mockPrivacyTipsRepo.loadPrivacyTips(loginUser));
      verifyNoMoreInteractions(mockPrivacyTipsRepo);
    },
  );
}
