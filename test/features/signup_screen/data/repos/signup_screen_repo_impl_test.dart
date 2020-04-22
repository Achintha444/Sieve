import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/Entities/empty_entity.dart';
import 'package:sieve_data_privacy_app/core/Error/exceptions.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/core/Platform/network_info.dart';
import 'package:sieve_data_privacy_app/features/signup_screen/data/datasources/signup_screen_remote_datasource.dart';
import 'package:sieve_data_privacy_app/features/signup_screen/data/repos/signup_screen_repo_impl.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockSignupScreenRemoteDataSource extends Mock
    implements SignupScreenRemoteDataSource {}

void main() {
  MockNetworkInfo mockNetworkInfo;
  SignupScreenRepoImpl signupScreenRepoImpl;
  MockSignupScreenRemoteDataSource mockSignupScreenRemoteDataSource;

  setUp(() {
    mockNetworkInfo = new MockNetworkInfo();
    mockSignupScreenRemoteDataSource = new MockSignupScreenRemoteDataSource();
    signupScreenRepoImpl = new SignupScreenRepoImpl(
        networkInfo: mockNetworkInfo,
        signupScreenRemoteDataSource: mockSignupScreenRemoteDataSource);
  });

  void groupTestOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  group('getSignup', () {
    final String email = 'test@gmail.com';
    final String password = 'test_password';

    test(
      'should check if the device is online',
      () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        //act
        signupScreenRepoImpl.getSignup(email, password);
        //assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    groupTestOnline(() {
      test(
        'should return LoginUser when sent the correct data',
        () async {
          //arrange
          when(mockSignupScreenRemoteDataSource.getSignupUser(any, any))
              .thenAnswer((_) async => EmptyEntity());
          //act
          final resilt = await signupScreenRepoImpl.getSignup(email, password);
          //assert
          expect(resilt, Right(EmptyEntity()));
        },
      );

      test(
        'should return InvalidInputFaliure when sent the incorrect data',
        () async {
          //arrange
          when(mockSignupScreenRemoteDataSource.getSignupUser(any, any))
              .thenThrow(InvalidInputException());
          //act
          final resilt = await signupScreenRepoImpl.getSignup(email, password);
          //assert
          expect(resilt, Left(InvalidInputFaliure()));
        },
      );

      test(
        'should return ServerFaliure when ServerException',
        () async {
          //arrange
          when(mockSignupScreenRemoteDataSource.getSignupUser(any, any))
              .thenThrow(ServerException());
          //act
          final resilt = await signupScreenRepoImpl.getSignup(email, password);
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
        final response = await signupScreenRepoImpl.getSignup(email, password);
        //assert
        verify(mockNetworkInfo.isConnected);
        expect(response, Left(InternetConnectionFaliure()));
        verifyNoMoreInteractions(mockNetworkInfo);
      },
    );
  });
}
