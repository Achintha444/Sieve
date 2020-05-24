import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/core/error/exceptions.dart';
import 'package:sieve_data_privacy_app/core/Platform/network_info.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

import 'package:sieve_data_privacy_app/features/dashboard/data/datasources/dashboard_remote_datasource.dart';
import 'package:sieve_data_privacy_app/features/dashboard/data/models/dapp_model.dart';
import 'package:sieve_data_privacy_app/features/dashboard/data/repos/dashboard_repo_impl.dart';
import 'package:sieve_data_privacy_app/features/dashboard/domain/entities/dapp.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockDashboardRemoteDataSource extends Mock
    implements DashboardRemoteDatasource {}

void main() {
  MockNetworkInfo mockNetworkInfo;
  MockDashboardRemoteDataSource mockDashboardRemoteDataSource;
  DashboardRepoImpl dashboardRepoImpl;

  setUp(() {
    mockNetworkInfo = new MockNetworkInfo();
    mockDashboardRemoteDataSource = new MockDashboardRemoteDataSource();
    dashboardRepoImpl = new DashboardRepoImpl(
        networkInfo: mockNetworkInfo,
        dashboardRemoteDatasource: mockDashboardRemoteDataSource);
  });


  final String id = '1';
  final String email = 'test1@gmail.com';
  final String password = 'Test@123';
  final LoginUser loginUser =
  new LoginUser(id: id, email: email, password: password);


  final List<DappModel> dappModels = new List<DappModel>();
  final List<Dapp> dapp = dappModels;

  void groupTestOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  group('loadDashboard', () {
    test(
      'should check if the device is online',
          () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        //act
        await dashboardRepoImpl.loadDashboard(loginUser);
        //assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    groupTestOnline(() {
      test(
        'should return List<Dapp> successfull',
            () async {
          //arrange
          when(mockDashboardRemoteDataSource.loadDashboard())
              .thenAnswer((_) async => dappModels);
          //act
          final result = await dashboardRepoImpl.loadDashboard(loginUser);
          //assert
          expect(result, Right(dapp));
        },
      );
      test(
        'should return ServerFaliure unsuccessfull',
            () async {
          //arrange
          when(mockDashboardRemoteDataSource.loadDashboard())
              .thenThrow(ServerException());
          //act
          final result = await dashboardRepoImpl.loadDashboard(loginUser);
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
        final result = await dashboardRepoImpl.loadDashboard(loginUser);
        //assert
        expect(result, Left(InternetConnectionFaliure()));
      },
    );
  });
}
