import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/features/bottom_nav/domain/usecases/navigate_to_category.dart';
import 'package:sieve_data_privacy_app/features/bottom_nav/domain/usecases/navigate_to_dashbaord.dart';
import 'package:sieve_data_privacy_app/features/bottom_nav/domain/usecases/navigate_to_news_feed.dart';
import 'package:sieve_data_privacy_app/features/bottom_nav/domain/usecases/navigate_to_privacy_laws.dart';
import 'package:sieve_data_privacy_app/features/bottom_nav/domain/usecases/navigate_to_privacy_tips.dart';
import 'package:sieve_data_privacy_app/features/bottom_nav/presentation/bloc/bottom_nav_bloc.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

class MockNavigateToNewsFeed extends Mock implements NavigateToNewsFeed {}

class MockNavigateToCategory extends Mock implements NavigateToCategory {}

class MockNavigateToDashboard extends Mock implements NavigateToDashboard {}

class MockNavigateToPrivacyTips extends Mock implements NavigateToPrivacyTips {}

class MockNavigateToPrivacyLaws extends Mock implements NavigateToPrivacyLaws {}

void main() {
  MockNavigateToNewsFeed mockNavigateToNewsFeed;
  MockNavigateToCategory mockNavigateToCategory;
  MockNavigateToDashboard mockNavigateToDashboard;
  MockNavigateToPrivacyTips mockNavigateToPrivacyTips;
  MockNavigateToPrivacyLaws mockNavigateToPrivacyLaws;
  BottomNavBloc bottomNavBloc;

  setUp(() {
    mockNavigateToNewsFeed = new MockNavigateToNewsFeed();
    mockNavigateToCategory = new MockNavigateToCategory();
    mockNavigateToDashboard = new MockNavigateToDashboard();
    mockNavigateToPrivacyTips = new MockNavigateToPrivacyTips();
    mockNavigateToPrivacyLaws = new MockNavigateToPrivacyLaws();
    bottomNavBloc = new BottomNavBloc(
        navigateToNewsFeed: mockNavigateToNewsFeed,
        navigateToCategory: mockNavigateToCategory,
        navigateToDashboard: mockNavigateToDashboard,
        navigateToPrivacyTips: mockNavigateToPrivacyTips,
        navigateToPrivacyLaws: mockNavigateToPrivacyLaws);
  });

  test(
    'initialState()',
    () async {
      //act
      final result = bottomNavBloc.initialState;
      //assert
      expect(result, Initial());
    },
  );

  final String email = 'test@gmail.com';
  final String password = 'Test@123';
  final String id = '1';

  final LoginUser loginUser =
      new LoginUser(id: id, email: email, password: password);

  group('NavigateToNewsFeed', () {
    BottomNavEvent event = NewsFeedEvent(user: loginUser);

    test(
      'should return [InternetError] when InternetConnectionFaliure is returned',
      () async {
        //arrange
        when(mockNavigateToNewsFeed(any))
            .thenAnswer((_) async => Left(InternetConnectionFaliure()));
        //act
        bottomNavBloc.dispatch(event);
        //assert
        final expected = [
          Initial(),
          Loading(),
          InternetError(event: event),
        ];
        expectLater(bottomNavBloc.state, emitsInOrder(expected));
      },
    );

    test(
      'should return [NewsFeedState] when EmptyEntity is returned',
      () async {
        //arrange
        when(mockNavigateToNewsFeed(any))
            .thenAnswer((_) async => Right(loginUser));
        //act
        bottomNavBloc.dispatch(event);
        //assert
        final expected = [
          Initial(),
          Loading(),
          NewsFeedState(user: loginUser),
        ];
        expectLater(bottomNavBloc.state, emitsInOrder(expected));
      },
    );
  });

  group('NavigateToCategory', () {
    BottomNavEvent event = CategoryEvent(user: loginUser);

    test(
      'should return [InternetError] when InternetConnectionFaliure is returned',
      () async {
        //arrange
        when(mockNavigateToCategory(any))
            .thenAnswer((_) async => Left(InternetConnectionFaliure()));
        //act
        bottomNavBloc.dispatch(event);
        //assert
        final expected = [
          Initial(),
          Loading(),
          InternetError(event: event),
        ];
        expectLater(bottomNavBloc.state, emitsInOrder(expected));
      },
    );

    test(
      'should return [CategoryState] when EmptyEntity is returned',
      () async {
        //arrange
        when(mockNavigateToCategory(any))
            .thenAnswer((_) async => Right(loginUser));
        //act
        bottomNavBloc.dispatch(event);
        //assert
        final expected = [
          Initial(),
          Loading(),
          CategoryState(user: loginUser),
        ];
        expectLater(bottomNavBloc.state, emitsInOrder(expected));
      },
    );
  });

  group('NavigateToDashboard', () {
    BottomNavEvent event = DashboardEvent(user: loginUser);

    test(
      'should return [InternetError] when InternetConnectionFaliure is returned',
      () async {
        //arrange
        when(mockNavigateToDashboard(any))
            .thenAnswer((_) async => Left(InternetConnectionFaliure()));
        //act
        bottomNavBloc.dispatch(event);
        //assert
        final expected = [
          Initial(),
          Loading(),
          InternetError(event: event),
        ];
        expectLater(bottomNavBloc.state, emitsInOrder(expected));
      },
    );

    test(
      'should return [DashboardState] when EmptyEntity is returned',
      () async {
        //arrange
        when(mockNavigateToDashboard(any))
            .thenAnswer((_) async => Right(loginUser));
        //act
        bottomNavBloc.dispatch(event);
        //assert
        final expected = [
          Initial(),
          Loading(),
          DashboardState(user: loginUser),
        ];
        expectLater(bottomNavBloc.state, emitsInOrder(expected));
      },
    );
  });

  group('NavigateToPrivacyTips', () {
    BottomNavEvent event = TipsEvent(user: loginUser);

    test(
      'should return [InternetError] when InternetConnectionFaliure is returned',
      () async {
        //arrange
        when(mockNavigateToPrivacyTips(any))
            .thenAnswer((_) async => Left(InternetConnectionFaliure()));
        //act
        bottomNavBloc.dispatch(event);
        //assert
        final expected = [
          Initial(),
          Loading(),
          InternetError(event: event),
        ];
        expectLater(bottomNavBloc.state, emitsInOrder(expected));
      },
    );

    test(
      'should return [PrivacyTipsState] when EmptyEntity is returned',
      () async {
        //arrange
        when(mockNavigateToPrivacyTips(any))
            .thenAnswer((_) async => Right(loginUser));
        //act
        bottomNavBloc.dispatch(event);
        //assert
        final expected = [
          Initial(),
          Loading(),
          PrivacyTipsState(user: loginUser),
        ];
        expectLater(bottomNavBloc.state, emitsInOrder(expected));
      },
    );
  });

  group('NavigateToPrivacyLaws', () {
    BottomNavEvent event = LawsEvent(user: loginUser);

    test(
      'should return [InternetError] when InternetConnectionFaliure is returned',
      () async {
        //arrange
        when(mockNavigateToPrivacyLaws(any))
            .thenAnswer((_) async => Left(InternetConnectionFaliure()));
        //act
        bottomNavBloc.dispatch(event);
        //assert
        final expected = [
          Initial(),
          Loading(),
          InternetError(event: event),
        ];
        expectLater(bottomNavBloc.state, emitsInOrder(expected));
      },
    );

    test(
      'should return [PrivacyLawsState] when EmptyEntity is returned',
      () async {
        //arrange
        when(mockNavigateToPrivacyLaws(any))
            .thenAnswer((_) async => Right(loginUser));
        //act
        bottomNavBloc.dispatch(event);
        //assert
        final expected = [
          Initial(),
          Loading(),
          PrivacyLawsState(user: loginUser),
        ];
        expectLater(bottomNavBloc.state, emitsInOrder(expected));
      },
    );
  });
}
