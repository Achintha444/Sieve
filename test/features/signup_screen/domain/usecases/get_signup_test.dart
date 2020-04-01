import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/Entities/empty_entity.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/features/signup_screen/domain/repos/signup_screen_repo.dart';
import 'package:sieve_data_privacy_app/features/signup_screen/domain/usecases/get_signup.dart';

class MockSignupScreenRepo extends Mock implements SignupScreenRepo {}

void main() {
  MockSignupScreenRepo mockSignupScreenRepo;
  GetSignup getSignup;

  setUp(() {
    mockSignupScreenRepo = new MockSignupScreenRepo();
    getSignup = new GetSignup(signupRepo: mockSignupScreenRepo);
  });

  //* var signupDetails = [email,password]
  //* signupDetails[0] == username
  //* signupDetails[1] == password

  final String _email = 'test@gmail.com';
  final String _password = 'testPassword';
  final List<String> _signupDetails = [_email, _password];

  test(
    'should return EmptyEnity() when opertaes correctly',
    () async {
      //arrange
      when(mockSignupScreenRepo.getSignup(_email, _password))
          .thenAnswer((_) async => Right(EmptyEntity()));
      //act
      final result = await getSignup(_signupDetails);
      //assert
      expect(result, Right(EmptyEntity()));
      verify(mockSignupScreenRepo.getSignup(_email, _password));
      verifyNoMoreInteractions(mockSignupScreenRepo);
    },
  );

  // TODO : Should change the following test when implemented properly

  test(
    'should return ScreenFaliure() when something went wron',
    () async {
      //arrange
      when(mockSignupScreenRepo.getSignup(_email, _password))
          .thenAnswer((_) async => Left(ScreenRenderFaliure()));
      //act
      final result = await getSignup(_signupDetails);
      //assert
      expect(result, Left(ScreenRenderFaliure()));
      verify(mockSignupScreenRepo.getSignup(_email, _password));
      verifyNoMoreInteractions(mockSignupScreenRepo);
    },
  );
}
