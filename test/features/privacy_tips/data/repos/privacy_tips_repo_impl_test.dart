import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/core/error/exceptions.dart';
import 'package:sieve_data_privacy_app/core/Platform/network_info.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/privacy_tips/data/datasources/privacy_tips_remote_datasource.dart';
import 'package:sieve_data_privacy_app/features/privacy_tips/data/models/tips_model.dart';
import 'package:sieve_data_privacy_app/features/privacy_tips/data/repos/privacy_tips_repo_impl.dart';
import 'package:sieve_data_privacy_app/features/privacy_tips/domain/entities/tips.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockPrivacyTipsRemoteDataSource extends Mock
    implements PrivacyTipsRemoteDatasource {}

void main() {
  MockNetworkInfo mockNetworkInfo;
  MockPrivacyTipsRemoteDataSource mockPrivacyTipsRemoteDataSource;
  PrivacyTipsRepoImpl privacyTipsRepoImpl;

  setUp(() {
    mockNetworkInfo = new MockNetworkInfo();
    mockPrivacyTipsRemoteDataSource = new MockPrivacyTipsRemoteDataSource();
    privacyTipsRepoImpl = new PrivacyTipsRepoImpl(
        networkInfo: mockNetworkInfo,
        privacyTipsRemoteDatasource: mockPrivacyTipsRemoteDataSource);
  });

  final String id = '1';
  final String email = 'test1@gmail.com';
  final String password = 'Test@123';
  final LoginUser loginUser =
      new LoginUser(id: id, email: email, password: password);

  final List<TipsModel> tipsModels = new List<TipsModel>();
  final List<Tips> tips = tipsModels;

  void groupTestOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  group('loadPrivacyTips', () {
    test(
      'should check if the device is online',
      () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        //act
        await privacyTipsRepoImpl.loadPrivacyTips(loginUser);
        //assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    groupTestOnline(() {
      test(
        'should return List<Laws> successfull',
        () async {
          //arrange
          when(mockPrivacyTipsRemoteDataSource.loadPrivacyTips())
              .thenAnswer((_) async => tipsModels);
          //act
          final result = await privacyTipsRepoImpl.loadPrivacyTips(loginUser);
          //assert
          expect(result, Right(tips));
        },
      );

      test(
        'should return ServerFaliure unsuccessfull',
        () async {
          //arrange
          when(mockPrivacyTipsRemoteDataSource.loadPrivacyTips())
              .thenThrow(ServerException());
          //act
          final result = await privacyTipsRepoImpl.loadPrivacyTips(loginUser);
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
        final result = await privacyTipsRepoImpl.loadPrivacyTips(loginUser);
        //assert
        expect(result, Left(InternetConnectionFaliure()));
      },
    );
  });
}
