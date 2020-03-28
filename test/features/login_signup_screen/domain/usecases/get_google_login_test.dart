import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/Entities/empty_entity.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/core/Usecase/use_case.dart';
import 'package:sieve_data_privacy_app/features/login_signup_screen/domain/repos/login_signup_screen_repo.dart';
import 'package:sieve_data_privacy_app/features/login_signup_screen/domain/usecases/get_Google_login.dart';

class MockLoginSignupScreenRepo extends Mock implements LoginSignuScreenRepo {}

void main() {
  MockLoginSignupScreenRepo mockLoginSignupScreenRepo;
  GetGoogleLogin getGoogleLogin;

  setUp(() {
    mockLoginSignupScreenRepo = new MockLoginSignupScreenRepo();
    getGoogleLogin =
        new GetGoogleLogin(loginSignuScreenRepo: mockLoginSignupScreenRepo);
  });

  test(
    'should return EmptyEnity() when opertaes correctly',
    () async {
      //arrange
      when(mockLoginSignupScreenRepo.getGoogleLogin())
          .thenAnswer((_) async => Right(EmptyEntity()));
      //act
      final result = await getGoogleLogin(NoParams());
      //assert
      expect(result, Right(EmptyEntity()));
      verify(mockLoginSignupScreenRepo.getGoogleLogin());
      verifyNoMoreInteractions(mockLoginSignupScreenRepo);
    },
  );

  // TODO : Should change the following test when implemented properly

  test(
    'should return ScreenFaliure() when something went wron',
    () async {
      //arrange
      when(mockLoginSignupScreenRepo.getGoogleLogin())
          .thenAnswer((_) async => Left(ScreenRenderFaliure()));
      //act
      final result = await getGoogleLogin(NoParams());
      //assert
      expect(result, Left(ScreenRenderFaliure()));
      verify(mockLoginSignupScreenRepo.getGoogleLogin());
      verifyNoMoreInteractions(mockLoginSignupScreenRepo);
    },
  );
}
