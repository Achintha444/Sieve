import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/Entities/empty_entity.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/suggestion/domain/usecases/send_suggestion.dart';
import 'package:sieve_data_privacy_app/features/suggestion/presentation/bloc/suggestion_bloc.dart';

class MockSendSuggestion extends Mock implements SendSuggestion {}

void main() {
  MockSendSuggestion mockSendSuggestion;
  SuggestionBloc suggestionBloc;

  setUp(() {
    mockSendSuggestion = new MockSendSuggestion();
    suggestionBloc = new SuggestionBloc(sendSuggestion: mockSendSuggestion);
  });

  final String id = '1';
  final String email = 'test1@gmail.com';
  final String password = 'Test@123';
  final String imageUrl = 'www.google.com';
  final String uid = '1';
  final LoginUser user = new LoginUser(
      id: id, email: email, password: password, imageUrl: imageUrl, uid: uid);
  final String suggestion = 'Suggestion';
  test(
    'initialState()',
    () async {
      //act
      final result = suggestionBloc.initialState;
      //assert
      expect(result, Initial());
    },
  );

  test(
    'should return [Loaded] when EmptyEntity is returned',
    () async {
      //arrange
      when(mockSendSuggestion(any))
          .thenAnswer((_) async => Right(EmptyEntity()));
      //act
      suggestionBloc.dispatch(
          SentSuggestionEvent(suggestion: suggestion, loginUser: user));
      //assert
      final expected = [Initial(), Loading(), Loaded(loginUser: user)];
      expectLater(suggestionBloc.state, emitsInOrder(expected));
    },
  );

  test(
    'should return [InternetError] when InternetConnectionFaliure is returned',
    () async {
      //arrange
      when(mockSendSuggestion(any))
          .thenAnswer((_) async => Left(InternetConnectionFaliure()));
      //act
      suggestionBloc.dispatch(
          SentSuggestionEvent(suggestion: suggestion, loginUser: user));
      //assert
      final expected = [Initial(), Loading(), InternetError(loginUser: user)];
      expectLater(suggestionBloc.state, emitsInOrder(expected));
    },
  );

  test(
    'should return [ServerError] when ServerFaliure is returned',
    () async {
      //arrange
      when(mockSendSuggestion(any))
          .thenAnswer((_) async => Left(ServerFaliure()));
      //act
      suggestionBloc.dispatch(
          SentSuggestionEvent(suggestion: suggestion, loginUser: user));
      //assert
      final expected = [Initial(), Loading(), ServerError()];
      expectLater(suggestionBloc.state, emitsInOrder(expected));
    },
  );
}
