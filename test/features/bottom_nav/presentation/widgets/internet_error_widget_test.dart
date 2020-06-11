import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/features/bottom_nav/presentation/bloc/bottom_nav_bloc.dart';
import 'package:sieve_data_privacy_app/features/bottom_nav/presentation/widgets/internet_error_widget.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

class MockBottomNavBloc extends Mock implements BottomNavBloc {}

void main() {
  MockBottomNavBloc mockBottomNavBloc;

  final String email = 'test@gmail.com';
  final String password = 'Test@123';
  final String id = '1';
  final String _imageUrl = 'www.google.com';
  final String _uid = '123';
  LoginUser loginUser;
  BottomNavEvent event;
  setUp(() {
    loginUser = new LoginUser(
        id: id,
        email: email,
        password: password,
        imageUrl: _imageUrl,
        uid: _uid);
    mockBottomNavBloc = new MockBottomNavBloc();
    event = new NewsFeedEvent(user: loginUser);
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

  testWidgets('BottomNavWidget Internet Error State Widget', (WidgetTester tester) async {
    //* Create the widget by telling the tester to build it.
    await tester.pumpWidget(buildTestableWidget(InternetErrorWidget(
      user: loginUser,
      event: event,
    )));

    final noInternetText = find.text('NO INTERNET'.toUpperCase());
    final connectionText = find.text('connection'.toUpperCase());
    final otherText =
        find.text('Connect to internet and try again'.toUpperCase());
    final floatingActionButton = find.byIcon(Icons.replay);

    expect(noInternetText, findsOneWidget);
    expect(connectionText, findsOneWidget);
    expect(otherText, findsOneWidget);
    expect(floatingActionButton, findsOneWidget);

    // Dispatch correct Event
    await tester.tap(floatingActionButton);
    await tester.pump();
    verify(mockBottomNavBloc.dispatch(event));
  });
}
