import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/Platform/network_info.dart';
import 'package:sieve_data_privacy_app/features/splash_screen/data/repos/splash_screen_repo_impl.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  MockNetworkInfo mockNetworkInfo;
  SplashScreenRepoImpl screenRepoImpl;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    screenRepoImpl = SplashScreenRepoImpl(networkInfo: mockNetworkInfo);
  });

  test(
    'should check if the device is online',
    () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      //act
      screenRepoImpl.navigateToLoginScreen();
      await untilCalled(mockNetworkInfo.isConnected);
      //assert
      //expect(response, true);
      verify(mockNetworkInfo.isConnected);
      verifyNoMoreInteractions(mockNetworkInfo);
    },
  );
}
