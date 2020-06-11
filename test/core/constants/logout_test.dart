import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sieve_data_privacy_app/core/Constants/logout.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/injection_container.dart';

class MockLoginUser extends Mock implements LoginUser {}

void main() {
  LoginUser user;

  setUp(() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences.setMockInitialValues({});
    await init();
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

  testWidgets('LogoutTest Widget Test', (WidgetTester tester) async {
    //* Create the widget by telling the tester to build it.
    await tester.pumpWidget(buildTestableWidget(Logout(
      icon: Icons.close,
      title: 'Logout',
      user: user,
    )));

    // //* LogoutTest has the correct content
    final gestureDetectorFinder = find.byKey(Key('gestureDetector'));
    final iconFinder = find.byIcon(Icons.close);
    final titleFinder = find.text('Logout'.toUpperCase());

    expect(gestureDetectorFinder, findsOneWidget);
    expect(iconFinder, findsOneWidget);
    expect(titleFinder, findsOneWidget);

    // //* should logout the user and move to login_signup screen
    await tester.tap(gestureDetectorFinder);
    await tester.pumpAndSettle();
    expect(find.text('LOGIN'), findsOneWidget);
    // await tester.pump();
  });
}
