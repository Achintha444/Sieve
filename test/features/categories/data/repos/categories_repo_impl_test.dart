import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/core/error/exceptions.dart';
import 'package:sieve_data_privacy_app/core/Platform/network_info.dart';
import 'package:sieve_data_privacy_app/features/categories/data/datasources/categories_remote_datasource.dart';
import 'package:sieve_data_privacy_app/features/categories/data/models/categories_model.dart';
import 'package:sieve_data_privacy_app/features/categories/data/repos/categories_repo_impl.dart';
import 'package:sieve_data_privacy_app/features/categories/domain/entities/categories.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockCategoriesRemoteDataSource extends Mock
    implements CategoriesRemoteDatasource {}

void main() {
  MockNetworkInfo mockNetworkInfo;
  MockCategoriesRemoteDataSource mockCategoriesRemoteDataSource;
  CategoriesRepoImpl categoriesRepoImpl;

  setUp(() {
    mockNetworkInfo = new MockNetworkInfo();
    mockCategoriesRemoteDataSource = new MockCategoriesRemoteDataSource();
    categoriesRepoImpl = new CategoriesRepoImpl(
        networkInfo: mockNetworkInfo,
        categoriesRemoteDatasource: mockCategoriesRemoteDataSource);
  });

  final String id = '1';
  final String email = 'test1@gmail.com';
  final String password = 'Test@123';
  final String _imageUrl = 'www.google.com';
  final String _uid = '123';
  final LoginUser loginUser = new LoginUser(
      id: id, email: email, password: password, imageUrl: _imageUrl, uid: _uid);

  final List<CategoriesModel> categoriesModels = new List<CategoriesModel>();
  final List<Categories> categories = categoriesModels;

  void groupTestOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  group('loadCategories', () {
    test(
      'should check if the device is online',
          () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        //act
        await categoriesRepoImpl.loadCategories(loginUser);
        //assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    groupTestOnline(() {
      test(
        'should return List<Categories> successfull',
            () async {
          //arrange
          when(mockCategoriesRemoteDataSource.loadCategories())
              .thenAnswer((_) async => categoriesModels);
          //act
          final result = await categoriesRepoImpl.loadCategories(loginUser);
          //assert
          expect(result, Right(categories));
        },
      );

      test(
        'should return ServerFaliure unsuccessfull',
            () async {
          //arrange
          when(mockCategoriesRemoteDataSource.loadCategories())
              .thenThrow(ServerException());
          //act
          final result = await categoriesRepoImpl.loadCategories(loginUser);
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
        final result = await categoriesRepoImpl.loadCategories(loginUser);
        //assert
        expect(result, Left(InternetConnectionFaliure()));
      },
    );
  });
}
