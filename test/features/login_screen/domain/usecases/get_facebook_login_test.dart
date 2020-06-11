import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/core/Usecase/use_case.dart';
import 'package:sieve_data_privacy_app/features/login_screen/data/models/login_user_model.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/repos/login_screen_repo.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/usecases/get_facebook_login.dart';

class MockLoginScreenRepo extends Mock implements LoginScreenRepo {}

void main() {
  MockLoginScreenRepo mockLoginScreenRepo;
  GetFacebookLogin getFacebookLogin;

  setUp(() {
    mockLoginScreenRepo = new MockLoginScreenRepo();
    getFacebookLogin =
        new GetFacebookLogin(loginScreenRepo: mockLoginScreenRepo);
  });

  final String id = '1';
  final String email = 'test1@gmail.com';
  final String password = 'Test@123';
  final String imageUrl = 'www.google.com';
  final String uid = '1';
  final LoginUserModel tLoginUserModel = new LoginUserModel(
      id: id, email: email, password: password, imageUrl: imageUrl, uid: uid);

  test(
    'should return EmptyEnity() when opertaes correctly',
    () async {
      //arrange
      when(mockLoginScreenRepo.getFacebookLogin())
          .thenAnswer((_) async => Right(tLoginUserModel));
      //act
      final result = await getFacebookLogin(NoParams());
      //assert
      expect(result, Right(tLoginUserModel));
      verify(mockLoginScreenRepo.getFacebookLogin());
      verifyNoMoreInteractions(mockLoginScreenRepo);
    },
  );

  test(
    'should return ServerFaliure() when something went wron',
    () async {
      //arrange
      when(mockLoginScreenRepo.getFacebookLogin())
          .thenAnswer((_) async => Left(ServerFaliure()));
      //act
      final result = await getFacebookLogin(NoParams());
      //assert
      expect(result, Left(ServerFaliure()));
      verify(mockLoginScreenRepo.getFacebookLogin());
      verifyNoMoreInteractions(mockLoginScreenRepo);
    },
  );

  test(
    'should return InternetConnectionFaliure() when something went wron',
    () async {
      //arrange
      when(mockLoginScreenRepo.getFacebookLogin())
          .thenAnswer((_) async => Left(InternetConnectionFaliure()));
      //act
      final result = await getFacebookLogin(NoParams());
      //assert
      expect(result, Left(InternetConnectionFaliure()));
      verify(mockLoginScreenRepo.getFacebookLogin());
      verifyNoMoreInteractions(mockLoginScreenRepo);
    },
  );


}
