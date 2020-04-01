import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/Entities/empty_entity.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
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
  final String _password = 'testPassword';
  final List<String> _loginDetails = [_email, _password];

  test(
    'should return EmptyEnity() when opertaes correctly',
    () async {
      //arrange
      when(mockLoginScreenRepo.getLogin(_email,_password))
          .thenAnswer((_) async => Right(EmptyEntity()));
      //act
      final result = await getLogin(_loginDetails);
      //assert
      expect(result, Right(EmptyEntity()));
      verify(mockLoginScreenRepo.getLogin(_email,_password));
      verifyNoMoreInteractions(mockLoginScreenRepo);
    },
  );

  // TODO : Should change the following test when implemented properly

  test(
    'should return ScreenFaliure() when something went wron',
    () async {
      //arrange
      when(mockLoginScreenRepo.getLogin(_email,_password))
          .thenAnswer((_) async => Left(ScreenRenderFaliure()));
      //act
      final result = await getLogin(_loginDetails);
      //assert
      expect(result, Left(ScreenRenderFaliure()));
      verify(mockLoginScreenRepo.getLogin(_email,_password));
      verifyNoMoreInteractions(mockLoginScreenRepo);
    },
  );
  
}
