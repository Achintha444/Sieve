import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/Entities/empty_entity.dart';
import 'package:sieve_data_privacy_app/core/Error/exceptions.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/core/Platform/network_info.dart';
import 'package:sieve_data_privacy_app/features/login_screen/data/datasources/login_screen_remote_datasource.dart';
import 'package:sieve_data_privacy_app/features/login_screen/data/models/login_user_model.dart';
import 'package:sieve_data_privacy_app/features/login_screen/data/repos/login_screen_repo_impl.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/login_signup_screen/domain/repos/login_signup_screen_repo.dart';

class MockLoginSignupScreenRepo extends Mock implements LoginSignuScreenRepo {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockLoginScreenRemoteDataSource extends Mock
    implements LoginScreenRemoteDataSource {}

// TODO: need to write the test after the google login and facebook login completed.

void main() {
  MockLoginSignupScreenRepo mockLoginSignupScreenRepo;
  MockNetworkInfo mockNetworkInfo;
  MockLoginScreenRemoteDataSource mockLoginScreenRemoteDataSource;
  LoginScreenRepoImpl loginScreenRepoImpl;

  setUp(() {
    mockLoginSignupScreenRepo = new MockLoginSignupScreenRepo();
    mockNetworkInfo = new MockNetworkInfo();
    mockLoginScreenRemoteDataSource = new MockLoginScreenRemoteDataSource();
    loginScreenRepoImpl = new LoginScreenRepoImpl(
        loginScreenRemoteDataSource: mockLoginScreenRemoteDataSource,
        loginSignuScreenRepo: mockLoginSignupScreenRepo,
        networkInfo: mockNetworkInfo);
  });

  void groupTestOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

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
    final LoginUserModel tLoginUserModel =
        new LoginUserModel(email: email, password: password);
    final LoginUser tLoginUser = tLoginUserModel;

    test(
      'should check if the device is online',
      () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        //act
        loginScreenRepoImpl.getLogin(email, password);
        //assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    groupTestOnline(() {
      test(
        'should return LoginUser when sent the correct data',
        () async {
          //arrange
          when(mockLoginScreenRemoteDataSource.getLoginUser(any, any))
              .thenAnswer((_) async => tLoginUserModel);
          //act
          final resilt = await loginScreenRepoImpl.getLogin(email, password);
          //assert
          expect(resilt, Right(tLoginUser));
        },
      );

      test(
        'should return InvalidInputFaliure when sent the incorrect data',
        () async {
          //arrange
          when(mockLoginScreenRemoteDataSource.getLoginUser(any, any))
              .thenThrow(InvalidInputException());
          //act
          final resilt = await loginScreenRepoImpl.getLogin(email, password);
          //assert
          expect(resilt, Left(InvalidInputFaliure()));
        },
      );

      test(
        'should return ServerFaliure when ServerException',
        () async {
          //arrange
          when(mockLoginScreenRemoteDataSource.getLoginUser(any, any))
              .thenThrow(ServerException());
          //act
          final resilt = await loginScreenRepoImpl.getLogin(email, password);
          //assert
          expect(resilt, Left(ServerFaliure()));
        },
      );
    });
    test(
      'should return InternetConnectionFaliure when there is no internet',
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
