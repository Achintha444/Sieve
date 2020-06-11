import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/Entities/empty_entity.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/core/error/exceptions.dart';
import 'package:sieve_data_privacy_app/core/Platform/network_info.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/suggestion/data/datasources/suggestion_remote_datasource.dart';
import 'package:sieve_data_privacy_app/features/suggestion/data/repos/suggestion_repo_impl.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockSuggestionRemoteDataSource extends Mock
    implements SuggestionRemoteDataSource {}

void main() {
  MockNetworkInfo mockNetworkInfo;
  MockSuggestionRemoteDataSource mockSuggestionRemoteDataSource;
  SuggestionRepoImpl suggestionRepoImpl;

  setUp(() {
    mockNetworkInfo = new MockNetworkInfo();
    mockSuggestionRemoteDataSource = new MockSuggestionRemoteDataSource();
    suggestionRepoImpl = new SuggestionRepoImpl(
        networkInfo: mockNetworkInfo,
        suggestionRemoteDataSource: mockSuggestionRemoteDataSource);
  });

  final String id = '1';
  final String email = 'test1@gmail.com';
  final String password = 'Test@123';

  final LoginUser loginUser = new LoginUser(
      id: id, email: email, password: password, imageUrl: null, uid: null);

  final String suggestion = 'Suggestion';

  void groupTestOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  test(
    'should check if the device is online',
    () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      //act
      await suggestionRepoImpl.sendSuggestion(loginUser, suggestion);
      //assert
      verify(mockNetworkInfo.isConnected);
    },
  );

  groupTestOnline(() {
    test(
      'should return EmptyEntity when inserted successfully',
      () async {
        //arrange
        when(mockSuggestionRemoteDataSource.insertSuggestion(
                loginUser, suggestion))
            .thenAnswer((_) async => EmptyEntity());
        //act
        final result =
            await suggestionRepoImpl.sendSuggestion(loginUser, suggestion);
        //assert
        expect(result, Right(EmptyEntity()));
      },
    );

    test(
      'should return ServerFaliure when not inserted successfully',
      () async {
        //arrange
        when(mockSuggestionRemoteDataSource.insertSuggestion(
                loginUser, suggestion))
            .thenThrow(ServerException());
        //act
        final result =
            await suggestionRepoImpl.sendSuggestion(loginUser, suggestion);
        //assert
        expect(result, Left(ServerFaliure()));
      },
    );
  });
}
