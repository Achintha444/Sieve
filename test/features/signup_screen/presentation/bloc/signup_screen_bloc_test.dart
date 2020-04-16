import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/Entities/empty_entity.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/features/signup_screen/domain/usecases/get_signup.dart';
import 'package:sieve_data_privacy_app/features/signup_screen/presentation/bloc/signup_screen_bloc.dart';

class MockGetSignup extends Mock implements GetSignup {}

void main() {
  MockGetSignup mockGetSignup;
  SignupScreenBloc signupScreenBloc;

  setUp(() {
    mockGetSignup = new MockGetSignup();
    signupScreenBloc = new SignupScreenBloc(getSignup: mockGetSignup);
  });

  test(
    'initialState()',
    () async {
      //act
      final result = signupScreenBloc.initialState;
      //assert
      expect(result, Initial());
    },
  );

  group('GetSignup', () {
    final String email = 'test@gmail.com';
    final String password = 'Test@123';
    test(
      'should return [InternetError] when InternetConnectionFaliure is returned',
      () async {
        //arrange
        when(mockGetSignup(any))
            .thenAnswer((_) async => Left(InternetConnectionFaliure()));
        //act
        signupScreenBloc
            .dispatch(GetSignupEvent(email: email, password: password));
        //assert
        final expected = [
          Initial(),
          Loading(),
          InternetError(),
        ];
        expectLater(signupScreenBloc.state, emitsInOrder(expected));
      },
    );

    test(
      'should return [InvalidInputError] when InvalidInputFaliure is returned',
      () async {
        //arrange
        when(mockGetSignup(any))
            .thenAnswer((_) async => Left(InvalidInputFaliure()));
        //act
        signupScreenBloc
            .dispatch(GetSignupEvent(email: email, password: password));
        //assert
        final expected = [
          Initial(),
          Loading(),
          InvalidInputError(),
        ];
        expectLater(signupScreenBloc.state, emitsInOrder(expected));
      },
    );

    test(
      'should return [ServerError] when ServerFaliure is returned',
      () async {
        //arrange
        when(mockGetSignup(any)).thenAnswer((_) async => Left(ServerFaliure()));
        //act
        signupScreenBloc
            .dispatch(GetSignupEvent(email: email, password: password));
        //assert
        final expected = [
          Initial(),
          Loading(),
          ServerError(),
        ];
        expectLater(signupScreenBloc.state, emitsInOrder(expected));
      },
    );

    test(
      'should return [Loaded] when EmptyEntity is returned',
      () async {
        //arrange
        when(mockGetSignup(any)).thenAnswer((_) async => Right(EmptyEntity()));
        //act
        signupScreenBloc
            .dispatch(GetSignupEvent(email: email, password: password));
        //assert
        final expected = [
          Initial(),
          Loading(),
          Loaded(),
        ];
        expectLater(signupScreenBloc.state, emitsInOrder(expected));
      },
    );
  });
}
