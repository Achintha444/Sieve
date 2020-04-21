import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

void main() {
  final String id = '1';
  final String email = 'test123@gmail.com';
  final String password = 'Test@123';

  final tLoginUser = new LoginUser(id: id, email: email, password: password);

  group('getID', () {
    test(
      'should return the email',
      () async {
        //act
        final response = tLoginUser.getId;
        //assert
        expect(response, id);
      },
    );
  });

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
