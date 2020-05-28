import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/dashboard/domain/entities/dapp.dart';
import 'package:sieve_data_privacy_app/features/dashboard/domain/usecases/load_dashboard.dart';
import 'package:sieve_data_privacy_app/features/dashboard/presentation/bloc/dashboard_bloc.dart';

class MockLoadDashboard extends Mock implements LoadDashboard {}

void main() {
  MockLoadDashboard mockLoadDashboard;
  DashboardBloc dashboardBloc;

  setUp(() {
    mockLoadDashboard = new MockLoadDashboard();
    dashboardBloc = new DashboardBloc(loadDashboard: mockLoadDashboard);
  });

  final String id = '1';
  final String email = 'test1@gmail.com';
  final String password = 'Test@123';
  final String _imageUrl = 'www.google.com';
  final String _uid = '123';
  final LoginUser user = new LoginUser(
      id: id, email: email, password: password, imageUrl: _imageUrl, uid: _uid);

  final List<Dapp> dapp = new List<Dapp>();

  test(
    'initialState()',
    () async {
      //act
      final result = dashboardBloc.initialState;
      //assert
      expect(result, Initial());
    },
  );

  test(
    'should return [Loaded] when the dapp returned',
    () async {
      //arrange
      when(mockLoadDashboard(any)).thenAnswer((_) async => Right(dapp));
      //act
      dashboardBloc.dispatch(LoadDashboardEvent(user: user));
      //assert
      final expected = [
        Initial(),
        Loading(),
        Loaded(user: user, dapp: dapp),
      ];
      expectLater(dashboardBloc.state, emitsInOrder(expected));
    },
  );

  test(
    'should return [InterntetError] when the tips returned',
    () async {
      //arrange
      when(mockLoadDashboard(any))
          .thenAnswer((_) async => Left(InternetConnectionFaliure()));
      //act
      dashboardBloc.dispatch(LoadDashboardEvent(user: user));
      //assert
      final expected = [
        Initial(),
        Loading(),
        InternetError(user: user),
      ];
      expectLater(dashboardBloc.state, emitsInOrder(expected));
    },
  );
}
