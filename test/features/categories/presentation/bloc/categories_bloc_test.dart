import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/features/categories/domain/entities/categories.dart';
import 'package:sieve_data_privacy_app/features/categories/domain/usecases/load_categories.dart';
import 'package:sieve_data_privacy_app/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

class MockLoadCategories extends Mock implements LoadCategories {}

void main() {
  MockLoadCategories mockLoadCategories;
  CategoriesBloc categoriesBloc;

  setUp(() {
    mockLoadCategories = new MockLoadCategories();
    categoriesBloc =
    new CategoriesBloc(loadCategories: mockLoadCategories);
  });

  final String id = '1';
  final String email = 'test@gmail.com';
  final String password = 'Test@123';
  final String _imageUrl = 'www.google.com';
  final String _uid = '123';
  final LoginUser user = new LoginUser(id: id, email: email, password: password,imageUrl: _imageUrl,uid: _uid);
  final List<Categories> categories = new List<Categories>();

  test(
    'initialState()',
        () async {
      //act
      final result = categoriesBloc.initialState;
      //assert
      expect(result, Initial());
    },
  );

  test(
    'should return [Loaded] when the Categories returned',
        () async {
      //arrange
      when(mockLoadCategories(any)).thenAnswer((_) async => Right(categories));
      //act
      categoriesBloc.dispatch(LoadCategoriesEvent(user: user));
      //assert
      final expected = [
        Initial(),
        Loading(),
        Loaded(user: user, categories: categories),
      ];
      expectLater(categoriesBloc.state, emitsInOrder(expected));
    },
  );

  test(
    'should return [InterntetError] when the Categories returned',
        () async {
      //arrange
      when(mockLoadCategories(any))
          .thenAnswer((_) async => Left(InternetConnectionFaliure()));
      //act
      categoriesBloc.dispatch(LoadCategoriesEvent(user: user));
      //assert
      final expected = [
        Initial(),
        Loading(),
        InternetError(user: user),
      ];
      expectLater(categoriesBloc.state, emitsInOrder(expected));
    },
  );
}
