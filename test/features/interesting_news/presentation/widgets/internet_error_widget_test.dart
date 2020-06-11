import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/features/interesting_news/presentation/bloc/interesting_news_bloc.dart';
import 'package:sieve_data_privacy_app/features/interesting_news/presentation/widgets/internet_error_widget.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

class MockInterestingNewsBloc extends Mock implements InterestingNewsBloc {}

void main() {
  MockInterestingNewsBloc mockInterestingNewsBloc;

  final String id = '1';
  final String email = 'test1@gmail.com';
  final String password = 'Test@123';
  final String _imageUrl = 'www.google.com';
  final String _uid = '123';
  LoginUser loginUser;
  InterestingNewsEvent event;
  setUp(() {
    loginUser = new LoginUser(
        id: id,
        email: email,
        password: password,
        imageUrl: _imageUrl,
        uid: _uid);
    mockInterestingNewsBloc = new MockInterestingNewsBloc();
    event = new LoadInterestingNewsEvent(user: loginUser);
  });

  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: BlocProvider<InterestingNewsBloc>(
          builder: (context) => mockInterestingNewsBloc,
          child: Material(
            child: widget,
          ),
        ),
      ),
    );
  }

  testWidgets('InternetErrorWidget - InterestingNews', (WidgetTester tester) async {
    //* Create the widget by telling the tester to build it.
    await tester.pumpWidget(buildTestableWidget(InternetErrorWidget(
      user: loginUser,
    )));

    final noInternetText = find.text('NO INTERNET'.toUpperCase());
    final connectionText = find.text('connection'.toUpperCase());
    final otherText = find.text('Connect to internet and try again'.toUpperCase());
    final floatingActionButton = find.byIcon(Icons.replay);

    expect(noInternetText, findsOneWidget);
    expect(connectionText, findsOneWidget);
    expect(otherText, findsOneWidget);
    expect(floatingActionButton, findsOneWidget);


    // Dispatch correct Event
    await tester.tap(floatingActionButton);
    await tester.pump();
    verify(mockInterestingNewsBloc.dispatch(event));
  });
}
