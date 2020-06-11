import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/core/error/Exceptions.dart';
import 'package:sieve_data_privacy_app/core/Platform/network_info.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/data/datasources/privacy_policy_remote_datasource.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/data/models/privacy_policy_model.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/data/repos/privacy_policy_repo_impl.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockPrivacyPolicyRemoteDataSource extends Mock
    implements PrivacyPolicyRemoteDatasource {}

void main() {
  MockNetworkInfo mockNetworkInfo;
  MockPrivacyPolicyRemoteDataSource mockPrivacyPolicyRemoteDataSource;
  PrivacyPolicyRepoImpl privacyPolicyRepoImpl;
  setUp(() {
    mockNetworkInfo = new MockNetworkInfo();
    mockPrivacyPolicyRemoteDataSource = new MockPrivacyPolicyRemoteDataSource();
    privacyPolicyRepoImpl = new PrivacyPolicyRepoImpl(
        networkInfo: mockNetworkInfo,
        privacyPolicyRemoteDatasource: mockPrivacyPolicyRemoteDataSource);
  });

  void groupTestOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  group('getPrivacyPolicy', () {
    final String id = '1';
    final String email = 'test1@gmail.com';
    final String password = 'Test@123';
    final String _imageUrl = 'www.google.com';
    final String _uid = '123';
    final LoginUser tLoginUserModel = new LoginUser(
        id: id,
        email: email,
        password: password,
        imageUrl: _imageUrl,
        uid: _uid);
    final LoginUser tLoginUser = tLoginUserModel;

    final tPrivacyPolicyModel = PrivacyPolicyModel(
        types: [
          "name",
          "email",
          "gender"
        ],
        usages: [
          "Location related information to provide,personalise and improve their product,including ads,for you and the others",
          "Network and connection information(people,pages,account,hashtags etc) may use to help others and you to find people you may know"
        ],
        removal: [
          "Data store until your account is deleted.",
          "But when  the account is deleted all posted information given by others about you is not deleted since it a part of your account.So they are not deleted "
        ],
        contactLink: "https://www.facebook.com/help/contact/861937627253138",
        email: "achinthaisuru444@gmail.com",
        fiLine: "Facebook,inc.ATTN:",
        sLine: "Privacy operation 1601",
        tLine: "Willow Road Menlo Park",
        foLine: "CA 94028,USA");
    test(
      'should check if the device is online',
      () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        //act
        await privacyPolicyRepoImpl.getPrivacyPolicy(id, tLoginUser);
        //assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    groupTestOnline(() {
      test(
        'should return PrivacyPolicy when sent the correct data',
        () async {
          //arrange
          when(mockPrivacyPolicyRemoteDataSource.loadPrivacyPolicy(any))
              .thenAnswer((_) async => tPrivacyPolicyModel);
          //act
          final result =
              await privacyPolicyRepoImpl.getPrivacyPolicy(id, tLoginUser);
          //assert
          expect(result, Right(tPrivacyPolicyModel));
        },
      );
      test(
        'should return ServerFaliure when ServerException',
        () async {
          //arrange
          when(mockPrivacyPolicyRemoteDataSource.loadPrivacyPolicy(any))
              .thenThrow(ServerException());
          //act
          final resilt =
              await privacyPolicyRepoImpl.getPrivacyPolicy(id, tLoginUser);
          //assert
          expect(resilt, Left(ServerFaliure()));
        },
      );
    });

    test(
      'should return InternetConnectionFaliure when there is no internet',
      () async {
        //arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
        //act
        final response =
            await privacyPolicyRepoImpl.getPrivacyPolicy(id, tLoginUser);
        //assert
        verify(mockNetworkInfo.isConnected);
        expect(response, Left(InternetConnectionFaliure()));
        verifyNoMoreInteractions(mockNetworkInfo);
      },
    );
  });
}
