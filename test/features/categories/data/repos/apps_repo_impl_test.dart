import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/core/error/exceptions.dart';
import 'package:sieve_data_privacy_app/core/Platform/network_info.dart';
import 'package:sieve_data_privacy_app/features/categories/data/datasources/apps_remote_datasource.dart';
import 'package:sieve_data_privacy_app/features/categories/data/models/apps_model.dart';
import 'package:sieve_data_privacy_app/features/categories/data/repos/apps_repo_impl.dart';
import 'package:sieve_data_privacy_app/features/categories/domain/entities/apps.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockAppsRemoteDataSource extends Mock
    implements AppsRemoteDatasource {}

void main() {
  MockNetworkInfo mockNetworkInfo;
  MockAppsRemoteDataSource mockAppsRemoteDataSource;
  AppsRepoImpl appsRepoImpl;

  setUp(() {
    mockNetworkInfo = new MockNetworkInfo();
    mockAppsRemoteDataSource = new MockAppsRemoteDataSource();
    appsRepoImpl = new AppsRepoImpl(
        networkInfo: mockNetworkInfo,
        appsRemoteDatasource: mockAppsRemoteDataSource);
  });

  final String id = '1';
  final String email = 'test1@gmail.com';
  final String password = 'Test@123';
  final String _imageUrl = 'www.google.com';
  final String _uid = '123';
  final LoginUser loginUser = new LoginUser(
      id: id, email: email, password: password, imageUrl: _imageUrl, uid: _uid);

  final List<AppsModel> appsModels = new List<AppsModel>();
  final List<App> apps = appsModels;

  void groupTestOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  group('loadApps', () {
    test(
      'should check if the device is online',
          () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        //act
        await appsRepoImpl.loadApps(loginUser, 1);
        //assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    groupTestOnline(() {
      test(
        'should return List<App> successfull',
            () async {
          //arrange
          when(mockAppsRemoteDataSource.loadApps(1))
              .thenAnswer((_) async => appsModels);
          //act
          final result = await appsRepoImpl.loadApps(loginUser, 1);
          //assert
          expect(result, Right(apps));
        },
      );

      test(
        'should return List<App> successfull',
            () async {
          //arrange
          when(mockAppsRemoteDataSource.loadAppsSearch())
              .thenAnswer((_) async => appsModels);
          //act
          final result = await appsRepoImpl.loadAppsSearch(loginUser);
          //assert
          expect(result, Right(apps));
        },
      );

      test(
        'should return ServerFaliure unsuccessfull',
            () async {
          //arrange
          when(mockAppsRemoteDataSource.loadApps(1))
              .thenThrow(ServerException());
          //act
          final result = await appsRepoImpl.loadApps(loginUser, 1);
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
        final result = await appsRepoImpl.loadApps(loginUser, 1);
        //assert
        expect(result, Left(InternetConnectionFaliure()));
      },
    );
  });
}
