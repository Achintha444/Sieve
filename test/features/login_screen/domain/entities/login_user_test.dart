import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

void main() {
  final String id = '1';
  final String email = 'test123@gmail.com';
  final String password = 'Test@123';
  final String uid = '1';
  final String imageUrl = 'www.google.com';

  final tLoginUser = new LoginUser(
      id: id, email: email, password: password, imageUrl: imageUrl, uid: uid);

  group('getID', () {
    test(
      'should return the ID',
      () async {
        //act
        final response = tLoginUser.getId;
        //assert
        expect(response, id);
      },
    );
  });

  group('getUid', () {
    test(
      'should return the Uid',
      () async {
        //act
        final response = tLoginUser.getUid;
        //assert
        expect(response, uid);
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

  group('getImageUrl', () {
    test(
      'should return the imageUrl',
      () async {
        //act
        final response = tLoginUser.getImageUrl;
        //assert
        expect(response, imageUrl);
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
