import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

void main() {
  final String email = 'test123@gmail.com';
  final String password = 'Test@123';

  final tLoginUser = new LoginUser(email: email, password: password);

  group('getEmail', () {
    test(
      'should return the email',
      () async {
        //act
        final response = tLoginUser.getEmail;
        //assert
        expect(response, email);
      },
    );
  });

  group('getPassword', () {
    test(
      'should return the password',
      () async {
        //act
        final response = tLoginUser.getPassword;
        //assert
        expect(response, password);
      },
    );
  });
}
