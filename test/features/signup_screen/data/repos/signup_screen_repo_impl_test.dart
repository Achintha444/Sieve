import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/Entities/empty_entity.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/core/Platform/network_info.dart';
import 'package:sieve_data_privacy_app/features/signup_screen/data/repos/signup_screen_repo_impl.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {}

// TODO: need to write the test after the google Signup and facebook Signup completed.

void main() {
  MockNetworkInfo mockNetworkInfo;
  SignupScreenRepoImpl signupScreenRepoImpl;

  setUp(() {
    mockNetworkInfo = new MockNetworkInfo();
    signupScreenRepoImpl =
        new SignupScreenRepoImpl(networkInfo: mockNetworkInfo);
  });

  group('getSignup', () {
    final String email = 'test@gmail.com';
    final String password = 'test_password';

    test(
      'should return EmptyEntity when there is internet',
      () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        //act
        final response = await signupScreenRepoImpl.getSignup(email, password);
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
        final response = await signupScreenRepoImpl.getSignup(email, password);
        //assert
        verify(mockNetworkInfo.isConnected);
        expect(response, Left(InternetConnectionFaliure()));
        verifyNoMoreInteractions(mockNetworkInfo);
      },
    );
  });
}
