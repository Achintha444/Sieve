import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/repos/login_screen_repo.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/usecases/get_login.dart';

class MockLoginScreenRepo extends Mock implements LoginScreenRepo {}

void main() {
  MockLoginScreenRepo mockLoginScreenRepo;
  GetLogin getLogin;

  setUp(() {
    mockLoginScreenRepo = new MockLoginScreenRepo();
    getLogin = new GetLogin(repo: mockLoginScreenRepo);
  });

  //* var loginDetails = [email,password]
  //* loginDetails[0] == username
  //* loginDetails[1] == password

  final String _email = 'test@gmail.com';
  final String _password = 'Test@123';
  final List<String> _loginDetails = [_email, _password];
  final LoginUser loginUser = new LoginUser(email: _email, password: _password);

  test(
    'should return LoginUser() when opertaes correctly',
    () async {
      //arrange
      when(mockLoginScreenRepo.getLogin(any,any))
          .thenAnswer((_) async => Right(loginUser));
      //act
      final result = await getLogin(_loginDetails);
      //assert
      expect(result, Right(loginUser));
      verify(mockLoginScreenRepo.getLogin(_email,_password));
      verifyNoMoreInteractions(mockLoginScreenRepo);
    },
  );

  test(
    'should return InternetConnectionFaliure() when there is no internetConnection',
    () async {
      //arrange
      when(mockLoginScreenRepo.getLogin(_email,_password))
          .thenAnswer((_) async => Left(InternetConnectionFaliure()));
      //act
      final result = await getLogin(_loginDetails);
      //assert
      expect(result, Left(InternetConnectionFaliure()));
      verify(mockLoginScreenRepo.getLogin(_email,_password));
      verifyNoMoreInteractions(mockLoginScreenRepo);
    },
  );

  test(
    'should return InvalidInputFaliure() when there is an error with the input',
    () async {
      //arrange
      when(mockLoginScreenRepo.getLogin(_email,_password))
          .thenAnswer((_) async => Left(InvalidInputFaliure()));
      //act
      final result = await getLogin(_loginDetails);
      //assert
      expect(result, Left(InvalidInputFaliure()));
      verify(mockLoginScreenRepo.getLogin(_email,_password));
      verifyNoMoreInteractions(mockLoginScreenRepo);
    },
  );

  test(
    'should return ServerFaliure() when there is an error with the server',
    () async {
      //arrange
      when(mockLoginScreenRepo.getLogin(_email,_password))
          .thenAnswer((_) async => Left(ServerFaliure()));
      //act
      final result = await getLogin(_loginDetails);
      //assert
      expect(result, Left(ServerFaliure()));
      verify(mockLoginScreenRepo.getLogin(_email,_password));
      verifyNoMoreInteractions(mockLoginScreenRepo);
    },
  );
  
}
