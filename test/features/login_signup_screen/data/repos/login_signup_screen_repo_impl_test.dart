import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/Entities/empty_entity.dart';
import 'package:sieve_data_privacy_app/core/Platform/network_info.dart';
import 'package:sieve_data_privacy_app/features/login_signup_screen/data/repos/login_signup_screen_repo_impl.dart';

class MockNetworkInfro extends Mock implements NetworkInfo {}

// TODO: need to write the test after the google login and facebook login completed.

void main() {
  MockNetworkInfro mockNetworkInfro;
  LoginSignupScreenRepoImpl loginSignupScreenRepoImpl;

  setUp(() {
    mockNetworkInfro = new MockNetworkInfro();
    loginSignupScreenRepoImpl =
        new LoginSignupScreenRepoImpl(networkInfo: mockNetworkInfro);
  });

  group('getFacebookLogin()', () {
    test(
      'should return EmptyEntity if there is internet connection',
      () async {
        //arrange
        when(mockNetworkInfro.isConnected).thenAnswer((_) async => true);
        //act
        final result = await loginSignupScreenRepoImpl.getFacebookLogin();
        //assert
        verify(mockNetworkInfro.isConnected);
        expect(result, Right(EmptyEntity()));
        verifyNoMoreInteractions(mockNetworkInfro);
      },
    );
  });

  group('getGoogleLogin()', () {
    test(
      'should return EmptyEntity if there is internet connection',
      () async {
        //arrange
        when(mockNetworkInfro.isConnected).thenAnswer((_) async => true);
        //act
        final result = await loginSignupScreenRepoImpl.getGoogleLogin();
        //assert
        verify(mockNetworkInfro.isConnected);
        expect(result, Right(EmptyEntity()));
        verifyNoMoreInteractions(mockNetworkInfro);
      },
    );
  });
}
