import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';

import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/interesting_news/domain/entities/news.dart';
import 'package:sieve_data_privacy_app/features/interesting_news/domain/usecases/load_intersting_news.dart';
import 'package:sieve_data_privacy_app/features/interesting_news/presentation/bloc/interesting_news_bloc.dart';

class MockLoadInterestingNews extends Mock implements LoadInterestingNews {}

void main() {
  MockLoadInterestingNews mockLoadInterestingNews;
  InterestingNewsBloc interestingNewsBloc;

  setUp(() {
    mockLoadInterestingNews = new MockLoadInterestingNews();
    interestingNewsBloc =
    new InterestingNewsBloc(loadInterestingNews: mockLoadInterestingNews);
  });

  final String id = '1';
  final String email = 'test@gmail.com';
  final String password = 'Test@123';
  final LoginUser user =
  new LoginUser(id: id, email: email, password: password);
  final List<News> news = new List<News>();

  test(
    'initialState()',
        () async {
      //act
      final result = interestingNewsBloc.initialState;
      //assert
      expect(result, Initial());
    },
  );

  test(
    'should return [Loaded] when the news returned',
        () async {
      //arrange
      when(mockLoadInterestingNews(any)).thenAnswer((_) async => Right(news));
      //act
      interestingNewsBloc.dispatch(LoadInterestingNewsEvent(user: user));
      //assert
      final expected = [
        Initial(),
        Loading(),
        Loaded(user: user, news: news),
      ];
      expectLater(interestingNewsBloc.state, emitsInOrder(expected));
    },
  );

  test(
    'should return [InterntetError] when the news returned',
        () async {
      //arrange
      when(mockLoadInterestingNews(any))
          .thenAnswer((_) async => Left(InternetConnectionFaliure()));
      //act
      interestingNewsBloc.dispatch(LoadInterestingNewsEvent(user: user));
      //assert
      final expected = [
        Initial(),
        Loading(),
        InternetError(user: user),
      ];
      expectLater(interestingNewsBloc.state, emitsInOrder(expected));
    },
  );
}

