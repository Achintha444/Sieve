import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:sieve_data_privacy_app/features/login_signup_screen/data/datasources/login_signup_screen_remote_datasource.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  MockHttpClient mockHttpClient;
  LoginSignupScreenRemoteDataSourceImpl remoteDataSource;

  setUp(() {
    mockHttpClient = new MockHttpClient();
    remoteDataSource =
        new LoginSignupScreenRemoteDataSourceImpl(httpClient: mockHttpClient);
  });

  test(
    'google sigin function should work properly',
    () async {
      final call = remoteDataSource.getGoogleLogin;
      expect(() => call(), throwsException);
    },
  );

  test(
    'google sigin out function should work properly',
    () async {
      final call = remoteDataSource.googleLogout;
      expect(() => call(), throwsException);
    },
  );
}
