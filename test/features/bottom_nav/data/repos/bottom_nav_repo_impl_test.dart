import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/core/Platform/network_info.dart';
import 'package:sieve_data_privacy_app/features/bottom_nav/data/repos/bottom_nav_repo_impl.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

class MockNetowrkInfo extends Mock implements NetworkInfo {}

void main() {
  MockNetowrkInfo mockNetowrkInfo;
  BottomNavRepoImpl bottomNavRepo;

  setUp(() {
    mockNetowrkInfo = new MockNetowrkInfo();
    bottomNavRepo = new BottomNavRepoImpl(networkInfo: mockNetowrkInfo);
  });

  final String email = 'test@gmail.com';
  final String password = 'Test@123';
  final String id = '1';

  final LoginUser loginUser =
      new LoginUser(id: id, email: email, password: password);

  group('NavigateToNewsFeed', () {
    test(
      'should return LoginUser when there is internet',
      () async {
        //arrange
        when(mockNetowrkInfo.isConnected).thenAnswer((_) async => true);
        //act
        final result = await bottomNavRepo.navigateToNewsFeed(loginUser);
        //assert
        expect(result, Right(loginUser));
      },
    );

    test(
      'should return InternetConnectionFaliure when there is no internet',
      () async {
        //arrange
        when(mockNetowrkInfo.isConnected).thenAnswer((_) async => false);
        //act
        final result = await bottomNavRepo.navigateToNewsFeed(loginUser);
        //assert
        expect(result, Left(InternetConnectionFaliure()));
      },
    );
  });

  group('navigateToCategory', () {
    test(
      'should return LoginUser when there is internet',
      () async {
        //arrange
        when(mockNetowrkInfo.isConnected).thenAnswer((_) async => true);
        //act
        final result = await bottomNavRepo.navigateToCategory(loginUser);
        //assert
        expect(result, Right(loginUser));
      },
    );

    test(
      'should return InternetConnectionFaliure when there is no internet',
      () async {
        //arrange
        when(mockNetowrkInfo.isConnected).thenAnswer((_) async => false);
        //act
        final result = await bottomNavRepo.navigateToCategory(loginUser);
        //assert
        expect(result, Left(InternetConnectionFaliure()));
      },
    );
  });
  group('NavigateToNewsFeed', () {
    test(
      'should return LoginUser when there is internet',
      () async {
        //arrange
        when(mockNetowrkInfo.isConnected).thenAnswer((_) async => true);
        //act
        final result = await bottomNavRepo.navigateToNewsFeed(loginUser);
        //assert
        expect(result, Right(loginUser));
      },
    );

    test(
      'should return InternetConnectionFaliure when there is no internet',
      () async {
        //arrange
        when(mockNetowrkInfo.isConnected).thenAnswer((_) async => false);
        //act
        final result = await bottomNavRepo.navigateToNewsFeed(loginUser);
        //assert
        expect(result, Left(InternetConnectionFaliure()));
      },
    );
  });
  group('NavigateToNewsFeed', () {
    test(
      'should return LoginUser when there is internet',
      () async {
        //arrange
        when(mockNetowrkInfo.isConnected).thenAnswer((_) async => true);
        //act
        final result = await bottomNavRepo.navigateToNewsFeed(loginUser);
        //assert
        expect(result, Right(loginUser));
      },
    );

    test(
      'should return InternetConnectionFaliure when there is no internet',
      () async {
        //arrange
        when(mockNetowrkInfo.isConnected).thenAnswer((_) async => false);
        //act
        final result = await bottomNavRepo.navigateToNewsFeed(loginUser);
        //assert
        expect(result, Left(InternetConnectionFaliure()));
      },
    );
  });
  group('NavigateToNewsFeed', () {
    test(
      'should return LoginUser when there is internet',
      () async {
        //arrange
        when(mockNetowrkInfo.isConnected).thenAnswer((_) async => true);
        //act
        final result = await bottomNavRepo.navigateToNewsFeed(loginUser);
        //assert
        expect(result, Right(loginUser));
      },
    );

    test(
      'should return InternetConnectionFaliure when there is no internet',
      () async {
        //arrange
        when(mockNetowrkInfo.isConnected).thenAnswer((_) async => false);
        //act
        final result = await bottomNavRepo.navigateToNewsFeed(loginUser);
        //assert
        expect(result, Left(InternetConnectionFaliure()));
      },
    );
  });
}
