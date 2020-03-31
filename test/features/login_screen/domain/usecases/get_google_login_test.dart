import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/Entities/empty_entity.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/core/Usecase/use_case.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/repos/login_screen_repo.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/usecases/get_google_login.dart';

class MockLoginScreenRepo extends Mock implements LoginScreenRepo {}

void main() {
  MockLoginScreenRepo mockLoginScreenRepo;
  GetGoogleLogin getGoogleLogin;

  setUp(() {
    mockLoginScreenRepo = new MockLoginScreenRepo();
    getGoogleLogin =
        new GetGoogleLogin(loginRepo:  mockLoginScreenRepo);
  });

  test(
    'should return EmptyEnity() when opertaes correctly',
    () async {
      //arrange
      when(mockLoginScreenRepo.getGoogleLogin())
          .thenAnswer((_) async => Right(EmptyEntity()));
      //act
      final result = await getGoogleLogin(NoParams());
      //assert
      expect(result, Right(EmptyEntity()));
      verify(mockLoginScreenRepo.getGoogleLogin());
      verifyNoMoreInteractions(mockLoginScreenRepo);
    },
  );

  // TODO : Should change the following test when implemented properly

  test(
    'should return ScreenFaliure() when something went wron',
    () async {
      //arrange
      when(mockLoginScreenRepo.getGoogleLogin())
          .thenAnswer((_) async => Left(ScreenRenderFaliure()));
      //act
      final result = await getGoogleLogin(NoParams());
      //assert
      expect(result, Left(ScreenRenderFaliure()));
      verify(mockLoginScreenRepo.getGoogleLogin());
      verifyNoMoreInteractions(mockLoginScreenRepo);
    },
  );
}
