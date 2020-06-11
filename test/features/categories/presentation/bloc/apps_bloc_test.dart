import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/features/categories/domain/entities/apps.dart';
import 'package:sieve_data_privacy_app/features/categories/domain/usecases/load_apps.dart';
import 'package:sieve_data_privacy_app/features/categories/presentation/bloc/apps_bloc.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

class MockLoadApps extends Mock implements LoadApps {}

void main() {
  MockLoadApps mockLoadApps;
  AppsBloc appsBloc;

  setUp(() {
    mockLoadApps = new MockLoadApps();
    appsBloc =
    new AppsBloc(loadApps: mockLoadApps);
  });

  final String id = '1';
  final String email = 'test@gmail.com';
  final String password = 'Test@123';
  final String _imageUrl = 'www.google.com';
  final String _uid = '123';
  final LoginUser user = new LoginUser(id: id, email: email, password: password,imageUrl: _imageUrl,uid: _uid);
  final List<App> apps = new List<App>();

  test(
    'initialState()',
        () async {
      //act
      final result = appsBloc.initialState;
      //assert
      expect(result, Initial());
    },
  );

  test(
    'should return [Loaded] when the Apps returned',
        () async {
      //arrange
      when(mockLoadApps(any)).thenAnswer((_) async => Right(apps));
      //act
      appsBloc.dispatch(LoadAppsEvent(user: user, categoryId: 2));
      //assert
      final expected = [
        Initial(),
        Loading(),
        Loaded(user: user, apps: apps, categoryId: 2),
      ];
      expectLater(appsBloc.state, emitsInOrder(expected));
    },
  );

  test(
    'should return [InterntetError] when the Apps returned',
        () async {
      //arrange
      when(mockLoadApps(any))
          .thenAnswer((_) async => Left(InternetConnectionFaliure()));
      //act
      appsBloc.dispatch(LoadAppsEvent(user: user, categoryId: 2));
      //assert
      final expected = [
        Initial(),
        Loading(),
        InternetError(user: user, categoryId: 2),
      ];
      expectLater(appsBloc.state, emitsInOrder(expected));
    },
  );
}
