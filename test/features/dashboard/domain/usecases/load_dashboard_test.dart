import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/dashboard/domain/entities/dapp.dart';
import 'package:sieve_data_privacy_app/features/dashboard/domain/repos/dashboard_repo.dart';
import 'package:sieve_data_privacy_app/features/dashboard/domain/usecases/load_dashboard.dart';

class MockDashboardRepo extends Mock implements DashboardRepo {}

void main() {
  MockDashboardRepo mockDashboardRepo;
  LoadDashboard loadDashboard;

  setUp(() {
    mockDashboardRepo = new MockDashboardRepo();
    loadDashboard =
    new LoadDashboard(dashboardRepo: mockDashboardRepo);
  });

  final String id = '1';
  final String email = 'test1@gmail.com';
  final String password = 'Test@123';
  final String _imageUrl = 'www.google.com';
  final String _uid = '123';
  final LoginUser loginUser = new LoginUser(
      id: id, email: email, password: password, imageUrl: _imageUrl, uid: _uid);

  final List<Dapp> tips = new List<Dapp>();

  test(
    'should return List<Dapp> when successful',
        () async {
      //arrange
      when(mockDashboardRepo.loadDashboard(loginUser))
          .thenAnswer((_) async => Right(tips));
      //act
      final results = await loadDashboard(loginUser);
      //assert
      expect(results, Right(tips));
      verify(mockDashboardRepo.loadDashboard(loginUser));
      verifyNoMoreInteractions(mockDashboardRepo);
    },
  );

  test(
    'should return ServerFaliure when unsuccessful',
        () async {
      //arrange
      when(mockDashboardRepo.loadDashboard(loginUser))
          .thenAnswer((_) async => Left(ServerFaliure()));
      //act
      final results = await loadDashboard(loginUser);
      //assert
      expect(results, Left(ServerFaliure()));
      verify(mockDashboardRepo.loadDashboard(loginUser));
      verifyNoMoreInteractions(mockDashboardRepo);
    },
  );

  test(
    'should return InternetConnectionFaliure when unsuccessful',
        () async {
      //arrange
      when(mockDashboardRepo.loadDashboard(loginUser))
          .thenAnswer((_) async => Left(InternetConnectionFaliure()));
      //act
      final results = await loadDashboard(loginUser);
      //assert
      expect(results, Left(InternetConnectionFaliure()));
      verify(mockDashboardRepo.loadDashboard(loginUser));
      verifyNoMoreInteractions(mockDashboardRepo);
    },
  );
}