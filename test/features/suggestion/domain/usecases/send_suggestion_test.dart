import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/Entities/empty_entity.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/suggestion/domain/repos/suggestion_repo.dart';
import 'package:sieve_data_privacy_app/features/suggestion/domain/usecases/send_suggestion.dart';

class MockSuggestoinRepo extends Mock implements SuggestionRepo {}

void main() {
  MockSuggestoinRepo suggestoinRepo;
  SendSuggestion sendSuggestion;

  setUp(() {
    suggestoinRepo = new MockSuggestoinRepo();
    sendSuggestion = new SendSuggestion(suggestionRepo: suggestoinRepo);
  });

  //* var params = [user,suggestion]
  //* params[0] == user
  //* params[1] == suggestion

  final String _id = '1';
  final String _email = 'test@gmail.com';
  final String _password = 'Test@123';
  final String _suggestion = 'Sample Suggestion';
  final LoginUser loginUser = new LoginUser(
      id: _id, email: _email, password: _password, uid: null, imageUrl: null);
  final List<dynamic> _params = [loginUser, _suggestion];

  test(
    'should retrun EmptyEntity() when operates correctly',
    () async {
      //arrange
      when(suggestoinRepo.sendSuggestion(_params[0], _params[1]))
          .thenAnswer((_) async => Right(EmptyEntity()));
      //act
      final result = await sendSuggestion(_params);
      //assert
      expect(result, Right(EmptyEntity()));
      verify(suggestoinRepo.sendSuggestion(_params[0], _params[1]));
      verifyNoMoreInteractions(suggestoinRepo);
    },
  );

  test(
    'should retrun ServerFaliure() when do not operates correctly',
    () async {
      //arrange
      when(suggestoinRepo.sendSuggestion(_params[0], _params[1]))
          .thenAnswer((_) async => Left(ServerFaliure()));
      //act
      final result = await sendSuggestion(_params);
      //assert
      expect(result, Left(ServerFaliure()));
      verify(suggestoinRepo.sendSuggestion(_params[0], _params[1]));
      verifyNoMoreInteractions(suggestoinRepo);
    },
  );
}
