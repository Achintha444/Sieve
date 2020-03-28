import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/features/splash_screen/presentation/bloc/splash_screen_bloc.dart';
import 'package:sieve_data_privacy_app/features/splash_screen/presentation/widgets/splash_screen_widget.dart';

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

  final Key imageKey = Key('logo_image');
  final Key circularProgressIndicatorKey = Key('circular_progress_indicator');

  testWidgets('SplashScreenWidget has the correct content', (WidgetTester tester) async {
    //* Create the widget by telling the tester to build it.
    await tester.pumpWidget(buildTestableWidget(SplashScreenWidget()));

    //* should dispatch NavigateToLoginScreenEvent when button tapped
    verify(mockSplashScreenBloc.dispatch(NavigateToLoginScreenEvent()));

    final imageFinder = find.byKey(imageKey);
    final circularIndicator = find.byKey(circularProgressIndicatorKey);

    expect(imageFinder, findsOneWidget);
    expect(circularIndicator, findsOneWidget);
  });
}
