import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/features/categories/domain/entities/apps.dart';
import 'package:sieve_data_privacy_app/features/categories/domain/usecases/load_apps_search.dart';
import 'package:sieve_data_privacy_app/features/categories/presentation/bloc/apps_search_bloc.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

class MockLoadAppsSearch extends Mock implements LoadAppsSearch {}

void main() {
  MockLoadAppsSearch mockLoadAppsSearch;
  AppsSearchBloc appsSearchBloc;

  setUp(() {
    mockLoadAppsSearch = new MockLoadAppsSearch();
    appsSearchBloc =
    new AppsSearchBloc(loadAppsSearch: mockLoadAppsSearch);
  });

  final String id = '1';
  final String email = 'test@gmail.com';
  final String password = 'Test@123';
  final String _imageUrl = 'www.google.com';
  final String _uid = '123';
  final LoginUser user = new LoginUser(id: id, email: email, password: password,imageUrl: _imageUrl,uid: _uid);
  final List<App> appsSearch = new List<App>();

  test(
    'initialState()',
        () async {
      //act
      final result = appsSearchBloc.initialState;
      //assert
      expect(result, Initial());
    },
  );

  test(
    'should return [Loaded] when the Apps returned',
        () async {
      //arrange
      when(mockLoadAppsSearch(any)).thenAnswer((_) async => Right(appsSearch));
      //act
      appsSearchBloc.dispatch(LoadAppsSearchEvent(user: user));
      //assert
      final expected = [
        Initial(),
        Loading(),
        Loaded(user: user, appsSearch: appsSearch),
      ];
      expectLater(appsSearchBloc.state, emitsInOrder(expected));
    },
  );

  test(
    'should return [InterntetError] when the Apps returned',
        () async {
      //arrange
      when(mockLoadAppsSearch(any))
          .thenAnswer((_) async => Left(InternetConnectionFaliure()));
      //act
      appsSearchBloc.dispatch(LoadAppsSearchEvent(user: user));
      //assert
      final expected = [
        Initial(),
        Loading(),
        InternetError(user: user),
      ];
      expectLater(appsSearchBloc.state, emitsInOrder(expected));
    },
  );
}
