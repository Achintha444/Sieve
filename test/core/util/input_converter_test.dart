import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/core/util/input_converter.dart';

void main() {
  InputConverter inputConverter;

  setUp(() {
    inputConverter = new InputConverter();
  });

  group('checkEmail()', () {
    test(
      'should return true when entered a vaild email',
      () async {
        //arrange
        final email = "test123@gmail.com";
        //act
        final result = inputConverter.checkEmail(email);
        //assert
        expect(result, true);
      },
    );

    test(
      'should return false when entered an invaild email',
      () async {
        //arrange
        final email = "test@123gmail.com";
        //act
        final result = inputConverter.checkEmail(email);
        //assert
        expect(result, false);
      },
    );
  });

  group('checkPassword()', () {
    //* password 1 - Uppercase, 1- Lowercase, 1 - number , 1- Specialase

    test(
      'should return true when entered a vaild password',
      () async {
        //arrange
        final password = "Test@123";
        //act
        final result = inputConverter.checkPassword(password);
        //assert
        expect(result, true);
      },
    );

    test(
      'should return false when entered an invaild password',
      () async {
        //arrange
        final password = "test";
        //act
        final result = inputConverter.checkEmail(password);
        //assert
        expect(result, false);
      },
    );
  });

  group('checkPasswordSimilar()', () {
    test(
      'should return true when entered tweo similar vaild passwords',
      () async {
        //arrange
        final password = "Test@123";
        final rePassword = "Test@123";
        //act
        final result = inputConverter.checkPasswordSimilar(password,rePassword);
        //assert
        expect(result, true);
      },
    );

    test(
      'should return false when entered tweo disimilar vaild passwords',
      () async {
        //arrange
        final password = "Test@123";
        final rePassword = "test@123";
        //act
        final result = inputConverter.checkPasswordSimilar(password,rePassword);
        //assert
        expect(result, false);
      },
    );
  });
}
