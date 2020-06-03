import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/core/Constants/licenses.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

class MockLoginUser extends Mock implements LoginUser {}

void main() {
  LoginUser user;

  setUp(() async {
    user = new MockLoginUser();
  });

  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: widget,
      ),
    );
  }

  testWidgets('Licences Widget Test', (WidgetTester tester) async {
    //* Create the widget by telling the tester to build it.
    await tester.pumpWidget(buildTestableWidget(Licences(
      icon: Icons.bookmark,
      title: 'Licences',
      user: user,
    )));

    // //* SuggAndLogout has the correct content
    final gestureDetectorFinder = find.byKey(Key('gestureDetector'));
    final iconFinder = find.byIcon(Icons.bookmark);
    final titleFinder = find.text('Licences'.toUpperCase());

    expect(gestureDetectorFinder, findsOneWidget);
    expect(iconFinder, findsOneWidget);
    expect(titleFinder, findsOneWidget);

  });
}
