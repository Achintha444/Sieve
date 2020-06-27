import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/core/error/exceptions.dart';
import 'package:sieve_data_privacy_app/core/Platform/network_info.dart';
import 'package:sieve_data_privacy_app/features/login_screen/data/datasources/login_screen_local_datasource.dart';
import 'package:sieve_data_privacy_app/features/login_screen/data/models/login_user_model.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/login_signup_screen/data/datasources/login_signup_screen_remote_datasource.dart';
import 'package:sieve_data_privacy_app/features/login_signup_screen/data/repos/login_signup_screen_repo_impl.dart';

class MockNetworkInfro extends Mock implements NetworkInfo {}

class MockLoginSignupScreenRemoteDataSource extends Mock
    implements LoginSignupScreenRemoteDataSource {}

class MockLoginScreenLocalDataSource extends Mock
    implements LoginScreenLocalDataSource {}

void main() {
  MockNetworkInfro mockNetworkInfro;
  MockLoginSignupScreenRemoteDataSource loginSignupScreenRemoteDataSource;
  MockLoginScreenLocalDataSource loginScreenLocalDataSource;
  LoginSignupScreenRepoImpl loginSignupScreenRepoImpl;

  setUp(() {
    mockNetworkInfro = new MockNetworkInfro();
    loginSignupScreenRemoteDataSource =
        new MockLoginSignupScreenRemoteDataSource();
    loginScreenLocalDataSource = new MockLoginScreenLocalDataSource();
    loginSignupScreenRepoImpl = new LoginSignupScreenRepoImpl(
        networkInfo: mockNetworkInfro,
        loginSignupScreenRemoteDataSource: loginSignupScreenRemoteDataSource,
        loginScreenLocalDataSource: loginScreenLocalDataSource);
  });

  final String id = '1';
  final String email = 'test1@gmail.com';
  final String password = 'Test@123';
  final String imageUrl = 'www.google.com';
  final String uid = '1';
  final LoginUserModel tLoginUserModel = new LoginUserModel(
      id: id, email: email, password: password, imageUrl: imageUrl, uid: uid);
  final LoginUser tLoginUser = tLoginUserModel;

  group('getFacebookLogin()', () {
    test(
      'should check whether there is internet connection',
      () async {
        //arrange
        when(mockNetworkInfro.isConnected).thenAnswer((_) async => true);
        //act
        await loginSignupScreenRepoImpl.getFacebookLogin();
        //assert
        verify(mockNetworkInfro.isConnected);
        verifyNoMoreInteractions(mockNetworkInfro);
      },
    );

    test(
      'should return LoginUser when there is connection',
      () async {
        //arrange
        when(mockNetworkInfro.isConnected).thenAnswer((_) async => true);
        when(loginSignupScreenRemoteDataSource.getFacebookLogin())
            .thenAnswer((_) async => tLoginUser);
        //act
        var result = await loginSignupScreenRepoImpl.getFacebookLogin();
        await untilCalled(loginScreenLocalDataSource.cacheFacebook());
        await untilCalled(loginScreenLocalDataSource.cacheLoginUser(any));
        //assert
        expect(result, Right(tLoginUser));
        verify(loginScreenLocalDataSource.cacheFacebook());
        verify(loginScreenLocalDataSource.cacheLoginUser(any));
      },
    );

    test(
      'should return ServerFailure when there is invalid connection',
      () async {
        //arrange
        when(mockNetworkInfro.isConnected).thenAnswer((_) async => true);
        when(loginSignupScreenRemoteDataSource.getFacebookLogin())
            .thenThrow(ServerException());
        //act
        var result = await loginSignupScreenRepoImpl.getFacebookLogin();
        //assert
        expect(result, Left(ServerFaliure()));
        verifyZeroInteractions(loginScreenLocalDataSource);
      },
    );
  });

  group('getGoogleLogin()', () {
    test(
      'should check whether there is internet connection',
      () async {
        //arrange
        when(mockNetworkInfro.isConnected).thenAnswer((_) async => true);
        //act
        await loginSignupScreenRepoImpl.getGoogleLogin();
        //assert
        verify(mockNetworkInfro.isConnected);
        verifyNoMoreInteractions(mockNetworkInfro);
      },
    );

    test(
      'should return LoginUser when there is connection',
      () async {
        //arrange
        when(mockNetworkInfro.isConnected).thenAnswer((_) async => true);
        when(loginSignupScreenRemoteDataSource.getGoogleLogin())
            .thenAnswer((_) async => tLoginUser);
        //act
        var result = await loginSignupScreenRepoImpl.getGoogleLogin();
        await untilCalled(loginScreenLocalDataSource.cacheGoogle());
        await untilCalled(loginScreenLocalDataSource.cacheLoginUser(any));
        //assert
        expect(result, Right(tLoginUser));
        verify(loginScreenLocalDataSource.cacheGoogle());
        verify(loginScreenLocalDataSource.cacheLoginUser(any));
      },
    );

    test(
      'should return ServerFailure when there is invalid connection',
      () async {
        //arrange
        when(mockNetworkInfro.isConnected).thenAnswer((_) async => true);
        when(loginSignupScreenRemoteDataSource.getGoogleLogin())
            .thenThrow(ServerException());
        //act
        var result = await loginSignupScreenRepoImpl.getGoogleLogin();
        //assert
        expect(result, Left(ServerFaliure()));
        verifyZeroInteractions(loginScreenLocalDataSource);
      },
    );
  });
}
