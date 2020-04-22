import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/core/error/exceptions.dart';
import 'package:sieve_data_privacy_app/core/Platform/network_info.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/privacy_laws/data/datasources/privacy_laws_remote_datasource.dart';
import 'package:sieve_data_privacy_app/features/privacy_laws/data/models/laws_model.dart';
import 'package:sieve_data_privacy_app/features/privacy_laws/data/repos/privacy_laws_repo_impl.dart';
import 'package:sieve_data_privacy_app/features/privacy_laws/domain/entities/laws.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockPrivacyLawsRemoteDataSource extends Mock
    implements PrivacyLawsRemoteDatasource {}

void main() {
  MockNetworkInfo mockNetworkInfo;
  MockPrivacyLawsRemoteDataSource mockPrivacyLawsRemoteDataSource;
  PrivacyLawsRepoImpl privacyLawsRepoImpl;

  setUp(() {
    mockNetworkInfo = new MockNetworkInfo();
    mockPrivacyLawsRemoteDataSource = new MockPrivacyLawsRemoteDataSource();
    privacyLawsRepoImpl = new PrivacyLawsRepoImpl(
        networkInfo: mockNetworkInfo,
        privacyLawsRemoteDatasource: mockPrivacyLawsRemoteDataSource);
  });

  final String id = '1';
  final String email = 'test1@gmail.com';
  final String password = 'Test@123';
  final LoginUser loginUser =
      new LoginUser(id: id, email: email, password: password);

  final List<LawsModel> lawsModels = new List<LawsModel>();
  final List<Laws> laws = lawsModels;

  void groupTestOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  group('loadPrivacyLaws', () {
    test(
      'should check if the device is online',
      () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        //act
        await privacyLawsRepoImpl.loadPrivacyLaws(loginUser);
        //assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    groupTestOnline(() {
      test(
        'should return List<Laws> successfull',
        () async {
          //arrange
          when(mockPrivacyLawsRemoteDataSource.loadPrivacyLaws())
              .thenAnswer((_) async => lawsModels);
          //act
          final result = await privacyLawsRepoImpl.loadPrivacyLaws(loginUser);
          //assert
          expect(result, Right(laws));
        },
      );

      test(
        'should return ServerFaliure unsuccessfull',
        () async {
          //arrange
          when(mockPrivacyLawsRemoteDataSource.loadPrivacyLaws())
              .thenThrow(ServerException());
          //act
          final result = await privacyLawsRepoImpl.loadPrivacyLaws(loginUser);
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
        final result = await privacyLawsRepoImpl.loadPrivacyLaws(loginUser);
        //assert
        expect(result, Left(InternetConnectionFaliure()));
      },
    );
  });
}
