import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/Entities/empty_entity.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/core/Usecase/use_case.dart';
import 'package:sieve_data_privacy_app/features/splash_screen/domain/repos/splash_screen_repo.dart';
import 'package:sieve_data_privacy_app/features/splash_screen/domain/usecases/navigate_to_login_screen.dart';

class MockSplashScreenRepo extends Mock implements SplashScreenRepo {}

void main() {
  NavigateToLoginScreen navigateToLoginScreen;
  MockSplashScreenRepo mockSplashScreenRepo;

  setUp(
    () {
      mockSplashScreenRepo = MockSplashScreenRepo();
      navigateToLoginScreen = NavigateToLoginScreen(
        splashScreenRepo: mockSplashScreenRepo,
      );
    },
  );

  final emptyEntity = EmptyEntity();
  final faliure = InternetConnectionFaliure();

  test(
    'should return EmptyEntity() when operates correctly',
    () async {
      //arrange
      when(mockSplashScreenRepo.navigateToLoginScreen()).thenAnswer(
        (_) async => Right(emptyEntity),
      );
      //act
      final result = await navigateToLoginScreen(NoParams());
      //assert
      expect(result, Right(emptyEntity));
      verify(mockSplashScreenRepo.navigateToLoginScreen());
      verifyNoMoreInteractions(mockSplashScreenRepo);
    },
  );

  test(
    'should return InternetConnectionFaliure() when there is no internet',
    () async {
      //arrange
      when(mockSplashScreenRepo.navigateToLoginScreen()).thenAnswer(
        (_) async => Left(faliure),
      );
      //act
      final result = await navigateToLoginScreen(NoParams());
      //assert
      //prefix0.expect(actual, matcher)
      expect(result, Left(faliure));
      verify(mockSplashScreenRepo.navigateToLoginScreen());
      verifyNoMoreInteractions(mockSplashScreenRepo);
    },
  );
}
