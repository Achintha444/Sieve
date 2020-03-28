import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/Entities/empty_entity.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/core/Usecase/use_case.dart';
import 'package:sieve_data_privacy_app/features/login_signup_screen/domain/repos/login_signup_screen_repo.dart';
import 'package:sieve_data_privacy_app/features/login_signup_screen/domain/usecases/get_facebook_login.dart';

class MockLoginSignupScreenRepo extends Mock implements LoginSignuScreenRepo {}

void main() {
  MockLoginSignupScreenRepo mockLoginSignupScreenRepo;
  GetFacebookLogin getFacebookLogin;

  setUp(() {
    mockLoginSignupScreenRepo = new MockLoginSignupScreenRepo();
    getFacebookLogin =
        new GetFacebookLogin(loginSignuScreenRepo: mockLoginSignupScreenRepo);
  });

  test(
    'should return EmptyEnity() when opertaes correctly',
    () async {
      //arrange
      when(mockLoginSignupScreenRepo.getFacebookLogin())
          .thenAnswer((_) async => Right(EmptyEntity()));
      //act
      final result = await getFacebookLogin(NoParams());
      //assert
      expect(result, Right(EmptyEntity()));
      verify(mockLoginSignupScreenRepo.getFacebookLogin());
      verifyNoMoreInteractions(mockLoginSignupScreenRepo);
    },
  );

  // TODO : Should change the following test when implemented properly 

  test(
    'should return ScreenFaliure() when something went wron',
    () async {
      //arrange
      when(mockLoginSignupScreenRepo.getFacebookLogin())
          .thenAnswer((_) async => Left(ScreenRenderFaliure()));
      //act
      final result = await getFacebookLogin(NoParams());
      //assert
      expect(result, Left(ScreenRenderFaliure()));
      verify(mockLoginSignupScreenRepo.getFacebookLogin());
      verifyNoMoreInteractions(mockLoginSignupScreenRepo);
    },
  );
}
