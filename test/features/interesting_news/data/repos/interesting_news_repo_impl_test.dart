import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/core/error/exceptions.dart';
import 'package:sieve_data_privacy_app/core/Platform/network_info.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/interesting_news/data/datasources/interesting_news_remote_datasource.dart';
import 'package:sieve_data_privacy_app/features/interesting_news/data/models/news_model.dart';
import 'package:sieve_data_privacy_app/features/interesting_news/data/repos/interestig_news_repo_impl.dart';
import 'package:sieve_data_privacy_app/features/interesting_news/domain/entities/news.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockInterestingNewsRemoteDataSource extends Mock
    implements InterestingNewsRemoteDatasource {}

void main() {
  MockNetworkInfo mockNetworkInfo;
  MockInterestingNewsRemoteDataSource mockInterestingNewsRemoteDataSource;
  InterestingNewsRepoImpl interestingNewsRepoImpl;

  setUp(() {
    mockNetworkInfo = new MockNetworkInfo();
    mockInterestingNewsRemoteDataSource = new MockInterestingNewsRemoteDataSource();
    interestingNewsRepoImpl = new InterestingNewsRepoImpl(
        networkInfo: mockNetworkInfo,
        interestingNewsRemoteDatasource: mockInterestingNewsRemoteDataSource);
  });


  final String id = '1';
  final String email = 'test1@gmail.com';
  final String password = 'Test@123';
  final LoginUser loginUser =
  new LoginUser(id: id, email: email, password: password);

  final List<NewsModel> newsModels = new List<NewsModel>();
  final List<News> news = newsModels;


  void groupTestOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  group('loadInterestingNews', () {
    test(
      'should check if the device is online',
          () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        //act
        await interestingNewsRepoImpl.loadInterestingNews(loginUser);
        //assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    groupTestOnline(() {
      test(
        'should return List<Laws> successfull',
            () async {
          //arrange
          when(mockInterestingNewsRemoteDataSource.loadInterestingNews())
              .thenAnswer((_) async => newsModels);
          //act
          final result = await interestingNewsRepoImpl.loadInterestingNews(loginUser);
          //assert
          expect(result, Right(news));
        },
      );

      test(
        'should return ServerFaliure unsuccessfull',
            () async {
          //arrange
          when(mockInterestingNewsRemoteDataSource.loadInterestingNews())
              .thenThrow(ServerException());
          //act
          final result = await interestingNewsRepoImpl.loadInterestingNews(loginUser);
          //assert
          expect(result, Left(ServerFaliure()));
        },
      );
    });

    test(
      'should return InternetConnectionFaliure when no internet',
          () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        //act
        final result = await interestingNewsRepoImpl.loadInterestingNews(loginUser);
        //assert
        expect(result, Left(InternetConnectionFaliure()));
      },
    );
  });
}

