import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/Entities/empty_entity.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/core/Platform/network_info.dart';
import 'package:sieve_data_privacy_app/features/login_screen/data/repos/login_screen_repo_impl.dart';
import 'package:sieve_data_privacy_app/features/login_signup_screen/domain/repos/login_signup_screen_repo.dart';

class MockLoginSignupScreenRepo extends Mock implements LoginSignuScreenRepo {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

// TODO: need to write the test after the google login and facebook login completed.

void main() {
  MockLoginSignupScreenRepo mockLoginSignupScreenRepo;
  MockNetworkInfo mockNetworkInfo;
  LoginScreenRepoImpl loginScreenRepoImpl;

  setUp(() {
    mockLoginSignupScreenRepo = new MockLoginSignupScreenRepo();
    mockNetworkInfo = new MockNetworkInfo();
    loginScreenRepoImpl = new LoginScreenRepoImpl(
        loginSignuScreenRepo: mockLoginSignupScreenRepo,
        networkInfo: mockNetworkInfo);
  });

  group('getFacebookLogin', () {
    test(
      'should return EmptyEntity when returned properly',
      () async {
        //arrange
        when(mockLoginSignupScreenRepo.getFacebookLogin())
            .thenAnswer((_) async => Right(EmptyEntity()));
        //act
        final response = await loginScreenRepoImpl.getFacebookLogin();

        //assert
        verify(mockLoginSignupScreenRepo.getFacebookLogin());
        expect(response, Right(EmptyEntity()));
        verifyNoMoreInteractions(mockLoginSignupScreenRepo);
      },
    );

    test(
      'should return InternetConnectionFailure when not returned properly',
      () async {
        //arrange
        when(mockLoginSignupScreenRepo.getFacebookLogin())
            .thenAnswer((_) async => Left(InternetConnectionFaliure()));
        //act
        final response = await loginScreenRepoImpl.getFacebookLogin();

        //assert
        verify(mockLoginSignupScreenRepo.getFacebookLogin());
        expect(response, Left(InternetConnectionFaliure()));
        verifyNoMoreInteractions(mockLoginSignupScreenRepo);
      },
    );
  });

  group('getGoogleLogin', () {
    test(
      'should return EmptyEntity when returned properly',
      () async {
        //arrange
        when(mockLoginSignupScreenRepo.getGoogleLogin())
            .thenAnswer((_) async => Right(EmptyEntity()));
        //act
        final response = await loginScreenRepoImpl.getGoogleLogin();

        //assert
        verify(mockLoginSignupScreenRepo.getGoogleLogin());
        expect(response, Right(EmptyEntity()));
        verifyNoMoreInteractions(mockLoginSignupScreenRepo);
      },
    );

    test(
      'should return InternetConnectionFailure when not returned properly',
      () async {
        //arrange
        when(mockLoginSignupScreenRepo.getGoogleLogin())
            .thenAnswer((_) async => Left(InternetConnectionFaliure()));
        //act
        final response = await loginScreenRepoImpl.getGoogleLogin();

        //assert
        verify(mockLoginSignupScreenRepo.getGoogleLogin());
        expect(response, Left(InternetConnectionFaliure()));
        verifyNoMoreInteractions(mockLoginSignupScreenRepo);
      },
    );
  });

  group('getLogin', () {
    final String email = 'test@gmail.com';
    final String password = 'test_password';

    test(
      'should return EmptyEntity when there is internet',
      () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        //act
        final response = await loginScreenRepoImpl.getLogin(email, password);
        //assert
        verify(mockNetworkInfo.isConnected);
        expect(response, Right(EmptyEntity()));
        verifyNoMoreInteractions(mockNetworkInfo);
      },
    );

    test(
      'should return EmptyEntity when there is internet',
      () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        //act
        final response = await loginScreenRepoImpl.getLogin(email, password);
        //assert
        verify(mockNetworkInfo.isConnected);
        expect(response, Left(InternetConnectionFaliure()));
        verifyNoMoreInteractions(mockNetworkInfo);
      },
    );
  });
}
