import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/features/categories/domain/entities/apps.dart';
import 'package:sieve_data_privacy_app/features/categories/domain/repos/apps_repo.dart';
import 'package:sieve_data_privacy_app/features/categories/domain/usecases/load_apps.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

class MockAppsRepo extends Mock implements AppsRepo {}

void main() {
  MockAppsRepo mockAppsRepo;
  LoadApps loadApps;

  setUp(() {
    mockAppsRepo = new MockAppsRepo();
    loadApps = new LoadApps(appsRepo: mockAppsRepo);
  });

  final String _id = '1';
  final String _email = 'test@gmail.com';
  final String _password = 'Test@123';
  final String _imageUrl = 'www.google.com';
  final String _uid = '123';
  final LoginUser loginUser =
  new LoginUser(id: _id, email: _email, password: _password,imageUrl: _imageUrl,uid: _uid);
  final List<App> apps = new List<App>();

  test(
    'should return List<App> when successful',
        () async {
      //arrange
      when(mockAppsRepo.loadApps(loginUser, 1))
          .thenAnswer((_) async => Right(apps));
      //act
      final results = await loadApps([loginUser, 1]);
      //assert
      expect(results, Right(apps));
      verify(mockAppsRepo.loadApps(loginUser, 1));
      verifyNoMoreInteractions(mockAppsRepo);
    },
  );

  test(
    'should return ServerFaliure when unsuccessful',
        () async {
      //arrange
      when(mockAppsRepo.loadApps(loginUser, 1))
          .thenAnswer((_) async => Left(ServerFaliure()));
      //act
      final results = await loadApps([loginUser, 1]);
      //assert
      expect(results, Left(ServerFaliure()));
      verify(mockAppsRepo.loadApps(loginUser, 1));
      verifyNoMoreInteractions(mockAppsRepo);
    },
  );

  test(
    'should return InternetConnectionFaliure when unsuccessful',
        () async {
      //arrange
      when(mockAppsRepo.loadApps(loginUser, 1))
          .thenAnswer((_) async => Left(InternetConnectionFaliure()));
      //act
      final results = await loadApps([loginUser, 1]);
      //assert
      expect(results, Left(InternetConnectionFaliure()));
      verify(mockAppsRepo.loadApps(loginUser, 1));
      verifyNoMoreInteractions(mockAppsRepo);
    },
  );
}
