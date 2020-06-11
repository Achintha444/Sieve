import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/features/bottom_nav/domain/repos/bottom_nav_repo.dart';
import 'package:sieve_data_privacy_app/features/bottom_nav/domain/usecases/navigate_to_category.dart';
import 'package:sieve_data_privacy_app/features/bottom_nav/domain/usecases/navigate_to_dashbaord.dart';
import 'package:sieve_data_privacy_app/features/bottom_nav/domain/usecases/navigate_to_news_feed.dart';
import 'package:sieve_data_privacy_app/features/bottom_nav/domain/usecases/navigate_to_privacy_laws.dart';
import 'package:sieve_data_privacy_app/features/bottom_nav/domain/usecases/navigate_to_privacy_tips.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

class MockBottomNavRepo extends Mock implements BottomNavRepo {}

void main() {
  MockBottomNavRepo mockBottomNavRepo;
  NavigateToNewsFeed navigateToNewsFeed;
  NavigateToCategory navigateToCategory;
  NavigateToDashboard navigateToDashboard;
  NavigateToPrivacyTips navigateToPrivacyTips;
  NavigateToPrivacyLaws navigateToPrivacyLaws;

  setUp(() {
    mockBottomNavRepo = new MockBottomNavRepo();
    navigateToNewsFeed =
        new NavigateToNewsFeed(bottomNavRepo: mockBottomNavRepo);
    navigateToCategory =
        new NavigateToCategory(bottomNavRepo: mockBottomNavRepo);
    navigateToDashboard =
        new NavigateToDashboard(bottomNavRepo: mockBottomNavRepo);
    navigateToPrivacyTips =
        new NavigateToPrivacyTips(bottomNavRepo: mockBottomNavRepo);
    navigateToPrivacyLaws =
        new NavigateToPrivacyLaws(bottomNavRepo: mockBottomNavRepo);
  });

  final String email = 'test@gmail.com';
  final String password = 'Test@123';
  final String id = '1';
  final String _imageUrl = 'www.google.com';
  final String _uid = '123';
  final LoginUser loginUser = new LoginUser(
      id: id,
      email: email,
      password: password,
      imageUrl: _imageUrl,
      uid: _uid);

  group('NavigateToNewsFeed', () {
    test(
      'should return LoginUser when there is internet',
      () async {
        //arrange
        when(mockBottomNavRepo.navigateToNewsFeed(any))
            .thenAnswer((_) async => Right(loginUser));
        //act
        final result = await navigateToNewsFeed(loginUser);
        //assert
        expect(result, Right(loginUser));
        verify(mockBottomNavRepo.navigateToNewsFeed(loginUser));
        verifyNoMoreInteractions(mockBottomNavRepo);
      },
    );

    test(
      'should return InternetConnectionFaliure when there is no internet',
      () async {
        //arrange
        when(mockBottomNavRepo.navigateToNewsFeed(any))
            .thenAnswer((_) async => Left(InternetConnectionFaliure()));
        //act
        final result = await navigateToNewsFeed(loginUser);
        //assert
        expect(result, Left(InternetConnectionFaliure()));
        verify(mockBottomNavRepo.navigateToNewsFeed(loginUser));
        verifyNoMoreInteractions(mockBottomNavRepo);
      },
    );
  });

  group('navigateToCategory', () {
    test(
      'should return LoginUser when there is internet',
      () async {
        //arrange
        when(mockBottomNavRepo.navigateToCategory(any))
            .thenAnswer((_) async => Right(loginUser));
        //act
        final result = await navigateToCategory(loginUser);
        //assert
        expect(result, Right(loginUser));
        verify(mockBottomNavRepo.navigateToCategory(loginUser));
        verifyNoMoreInteractions(mockBottomNavRepo);
      },
    );

    test(
      'should return InternetConnectionFaliure when there is no internet',
      () async {
        //arrange
        when(mockBottomNavRepo.navigateToCategory(any))
            .thenAnswer((_) async => Left(InternetConnectionFaliure()));
        //act
        final result = await navigateToCategory(loginUser);
        //assert
        expect(result, Left(InternetConnectionFaliure()));
        verify(mockBottomNavRepo.navigateToCategory(loginUser));
        verifyNoMoreInteractions(mockBottomNavRepo);
      },
    );
  });

  group('navigateToDashboard', () {
    test(
      'should return LoginUser when there is internet',
      () async {
        //arrange
        when(mockBottomNavRepo.navigateToDashboard(any))
            .thenAnswer((_) async => Right(loginUser));
        //act
        final result = await navigateToDashboard(loginUser);
        //assert
        expect(result, Right(loginUser));
        verify(mockBottomNavRepo.navigateToDashboard(loginUser));
        verifyNoMoreInteractions(mockBottomNavRepo);
      },
    );

    test(
      'should return InternetConnectionFaliure when there is no internet',
      () async {
        //arrange
        when(mockBottomNavRepo.navigateToDashboard(any))
            .thenAnswer((_) async => Left(InternetConnectionFaliure()));
        //act
        final result = await navigateToDashboard(loginUser);
        //assert
        expect(result, Left(InternetConnectionFaliure()));
        verify(mockBottomNavRepo.navigateToDashboard(loginUser));
        verifyNoMoreInteractions(mockBottomNavRepo);
      },
    );
  });

  group('NavigateToPrivacyTips', () {
    test(
      'should return LoginUser when there is internet',
      () async {
        //arrange
        when(mockBottomNavRepo.navigateToPrivacyTips(any))
            .thenAnswer((_) async => Right(loginUser));
        //act
        final result = await navigateToPrivacyTips(loginUser);
        //assert
        expect(result, Right(loginUser));
        verify(mockBottomNavRepo.navigateToPrivacyTips(loginUser));
        verifyNoMoreInteractions(mockBottomNavRepo);
      },
    );

    test(
      'should return InternetConnectionFaliure when there is no internet',
      () async {
        //arrange
        when(mockBottomNavRepo.navigateToPrivacyTips(any))
            .thenAnswer((_) async => Left(InternetConnectionFaliure()));
        //act
        final result = await navigateToPrivacyTips(loginUser);
        //assert
        expect(result, Left(InternetConnectionFaliure()));
        verify(mockBottomNavRepo.navigateToPrivacyTips(loginUser));
        verifyNoMoreInteractions(mockBottomNavRepo);
      },
    );
  });

  group('NavigateToPrivacyLaws', () {
    test(
      'should return LoginUser when there is internet',
      () async {
        //arrange
        when(mockBottomNavRepo.navigateToPrivacyLaws(any))
            .thenAnswer((_) async => Right(loginUser));
        //act
        final result = await navigateToPrivacyLaws(loginUser);
        //assert
        expect(result, Right(loginUser));
        verify(mockBottomNavRepo.navigateToPrivacyLaws(loginUser));
        verifyNoMoreInteractions(mockBottomNavRepo);
      },
    );

    test(
      'should return InternetConnectionFaliure when there is no internet',
      () async {
        //arrange
        when(mockBottomNavRepo.navigateToPrivacyLaws(any))
            .thenAnswer((_) async => Left(InternetConnectionFaliure()));
        //act
        final result = await navigateToPrivacyLaws(loginUser);
        //assert
        expect(result, Left(InternetConnectionFaliure()));
        verify(mockBottomNavRepo.navigateToPrivacyLaws(loginUser));
        verifyNoMoreInteractions(mockBottomNavRepo);
      },
    );
  });
}
