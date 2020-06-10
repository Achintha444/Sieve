import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/features/categories/domain/entities/categories.dart';
import 'package:sieve_data_privacy_app/features/categories/domain/repos/categories_repo.dart';
import 'package:sieve_data_privacy_app/features/categories/domain/usecases/load_categories.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

class MockCategoriesRepo extends Mock implements CategoriesRepo {}

void main() {
  MockCategoriesRepo mockCategoriesRepo;
  LoadCategories loadCategories;

  setUp(() {
    mockCategoriesRepo = new MockCategoriesRepo();
    loadCategories = new LoadCategories(categoriesRepo: mockCategoriesRepo);
  });

  final String _id = '1';
  final String _email = 'test@gmail.com';
  final String _password = 'Test@123';
  final String _imageUrl = 'www.google.com';
  final String _uid = '123';
  final LoginUser loginUser =
  new LoginUser(id: _id, email: _email, password: _password,imageUrl: _imageUrl,uid: _uid);
  final List<Categories> categories = new List<Categories>();

  test(
    'should return List<Categories> when successful',
        () async {
      //arrange
      when(mockCategoriesRepo.loadCategories(loginUser))
          .thenAnswer((_) async => Right(categories));
      //act
      final results = await loadCategories(loginUser);
      //assert
      expect(results, Right(categories));
      verify(mockCategoriesRepo.loadCategories(loginUser));
      verifyNoMoreInteractions(mockCategoriesRepo);
    },
  );

  test(
    'should return ServerFaliure when unsuccessful',
        () async {
      //arrange
      when(mockCategoriesRepo.loadCategories(loginUser))
          .thenAnswer((_) async => Left(ServerFaliure()));
      //act
      final results = await loadCategories(loginUser);
      //assert
      expect(results, Left(ServerFaliure()));
      verify(mockCategoriesRepo.loadCategories(loginUser));
      verifyNoMoreInteractions(mockCategoriesRepo);
    },
  );

  test(
    'should return InternetConnectionFaliure when unsuccessful',
        () async {
      //arrange
      when(mockCategoriesRepo.loadCategories(loginUser))
          .thenAnswer((_) async => Left(InternetConnectionFaliure()));
      //act
      final results = await loadCategories(loginUser);
      //assert
      expect(results, Left(InternetConnectionFaliure()));
      verify(mockCategoriesRepo.loadCategories(loginUser));
      verifyNoMoreInteractions(mockCategoriesRepo);
    },
  );
}
