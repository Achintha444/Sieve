import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/features/interesting_news/domain/repos/interesting_news_repo.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/interesting_news/domain/entities/news.dart';
import 'package:sieve_data_privacy_app/features/interesting_news/domain/usecases/load_intersting_news.dart';

class MockInterestingNewsRepo extends Mock implements InterestingNewsRepo {}

void main() {
  MockInterestingNewsRepo mockInterestingNewsRepo;
  LoadInterestingNews loadInterestingNews;

  setUp(() {
    mockInterestingNewsRepo = new MockInterestingNewsRepo();
    loadInterestingNews =
    new LoadInterestingNews(interestingNewsRepo: mockInterestingNewsRepo);
  });

  final String _id = '1';
  final String _email = 'test@gmail.com';
  final String _password = 'Test@123';
  final LoginUser loginUser =
  new LoginUser(id: _id, email: _email, password: _password);
  final List<News> news = new List<News>();


  test(
    'should return List<News> when successful',
        () async {
      //arrange
      when(mockInterestingNewsRepo.loadInterestingNews(loginUser))
          .thenAnswer((_) async => Right(news));
      //act
      final results = await loadInterestingNews(loginUser);
      //assert
      expect(results, Right(news));
      verify(mockInterestingNewsRepo.loadInterestingNews(loginUser));
      verifyNoMoreInteractions(mockInterestingNewsRepo);
    },
  );

  test(
    'should return ServerFaliure when unsuccessful',
        () async {
      //arrange
          when(mockInterestingNewsRepo.loadInterestingNews(loginUser))
          .thenAnswer((_) async => Left(ServerFaliure()));
      //act
      final results = await loadInterestingNews(loginUser);
      //assert
      expect(results, Left(ServerFaliure()));
      verify(mockInterestingNewsRepo.loadInterestingNews(loginUser));
      verifyNoMoreInteractions(mockInterestingNewsRepo);
    },
  );

  test(
    'should return InternetConnectionFaliure when unsuccessful',
        () async {
      //arrange
      when(mockInterestingNewsRepo.loadInterestingNews(loginUser))
          .thenAnswer((_) async => Left(InternetConnectionFaliure()));
      //act
      final results = await loadInterestingNews(loginUser);
      //assert
      expect(results, Left(InternetConnectionFaliure()));
      verify(mockInterestingNewsRepo.loadInterestingNews(loginUser));
      verifyNoMoreInteractions(mockInterestingNewsRepo);
    },
  );
}



