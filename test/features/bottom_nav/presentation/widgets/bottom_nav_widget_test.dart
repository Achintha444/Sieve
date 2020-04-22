import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/features/bottom_nav/presentation/bloc/bottom_nav_bloc.dart';
import 'package:sieve_data_privacy_app/features/bottom_nav/presentation/widgets/bottom_nav_widget.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

class MockBottomNavBloc extends Mock implements BottomNavBloc {}

void main() {
  MockBottomNavBloc mockBottomNavBloc;

  final String email = 'test@gmail.com';
  final String password = 'Test@123';
  final String id = '1';
  LoginUser loginUser;
  setUp(() {
    loginUser = new LoginUser(id: id, email: email, password: password);
    mockBottomNavBloc = new MockBottomNavBloc();
  });

  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: BlocProvider<BottomNavBloc>(
          builder: (context) => mockBottomNavBloc,
          child: Material(
            child: widget,
          ),
        ),
      ),
    );
  }

  testWidgets('BottomNavWidget', (WidgetTester tester) async {
    //* Create the widget by telling the tester to build it.
    await tester.pumpWidget(buildTestableWidget(BottomNavWidget(user: loginUser,)));

    final bottomNavFinder = find.byKey(Key('bottomNav'));
    final newsFeedFinder = find.byKey(Key('News Feed'));
    final categoryFinder = find.byKey(Key('Category'));
    final dashboardFinder = find.byKey(Key('Dashboard'));
    final privacyTipsFinder = find.byKey(Key('Privacy Tips'));
    final privacyLawsFinder = find.byKey(Key('Privacy Laws'));

    expect(bottomNavFinder, findsOneWidget);
    expect(newsFeedFinder, findsOneWidget);
    expect(categoryFinder, findsOneWidget);
    expect(dashboardFinder, findsOneWidget);
    expect(privacyTipsFinder, findsOneWidget);
    expect(privacyLawsFinder, findsOneWidget);

    // Dispatch correct Event
    await tester.tap(newsFeedFinder);
    await tester.pump();
    verify(mockBottomNavBloc.dispatch(NewsFeedEvent(user: loginUser)));

    await tester.tap(categoryFinder);
    await tester.pump();
    verify(mockBottomNavBloc.dispatch(CategoryEvent(user: loginUser)));

    await tester.tap(dashboardFinder);
    await tester.pump();
    verify(mockBottomNavBloc.dispatch(DashboardEvent(user: loginUser)));

    await tester.tap(privacyTipsFinder);
    await tester.pump();
    verify(mockBottomNavBloc.dispatch(TipsEvent(user: loginUser)));

    await tester.tap(privacyLawsFinder);
    await tester.pump();
    verify(mockBottomNavBloc.dispatch(LawsEvent(user: loginUser)));
  });
}
