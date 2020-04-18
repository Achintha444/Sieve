import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/features/splash_screen/presentation/bloc/splash_screen_bloc.dart';
import 'package:sieve_data_privacy_app/features/splash_screen/presentation/widgets/internet_error_widget.dart';

class MockSplashScreenBloc extends Mock implements SplashScreenBloc {}

void main() {
  MockSplashScreenBloc mockSplashScreenBloc;

  setUp(() {
    mockSplashScreenBloc = new MockSplashScreenBloc();
  });

  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: BlocProvider<SplashScreenBloc>(
          builder: (context) => mockSplashScreenBloc,
          child: widget,
        ),
      ),
    );
  }

  testWidgets('InternetErrorWidget', (WidgetTester tester) async {
    //* Create the widget by telling the tester to build it.
    await tester.pumpWidget(buildTestableWidget(InternetErrorWidget()));

    //* InternetErrorWidget has the correct content
    final textOneFinder = find.text('NO INTERNET'.toUpperCase());
    final textTwoFinder = find.text('connection'.toUpperCase());
    final textThreeFinder =
        find.text('Connect to internet and try again'.toUpperCase());
    final buttonFinder = find.byIcon(Icons.replay);

    expect(textOneFinder, findsOneWidget);
    expect(textTwoFinder, findsOneWidget);
    expect(textThreeFinder, findsOneWidget);
    expect(buttonFinder, findsOneWidget);

    //* should dispatch NavigateToLoginScreenEvent when button tapped
    await tester.tap(buttonFinder);
    await tester.pump();
    verify(mockSplashScreenBloc.dispatch(NavigateToLoginScreenEvent()));
  });
}
