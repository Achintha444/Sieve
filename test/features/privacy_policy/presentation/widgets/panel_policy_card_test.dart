import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/presentation/widgets/privacy_policy_card.dart';

void main() {
  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(home: Material(child: widget)),
    );
  }

  testWidgets('Panel Policy Card Widget', (WidgetTester tester) async {
    final LoginUser user = new LoginUser(
      id: '1',
      email: 'temp@gmail.com',
      password: 'Temp@123',
      uid: '123',
      imageUrl: 'www.google.com',
    );
    final String title = 'Google';
    final String subtitle = 'Google Subtitle';
    final Text content = Text('Content');

    await tester.pumpWidget(buildTestableWidget(PrivacyPolicyCard(
      user: user,
      title: title,
      subtitle: subtitle,
      content: content,
    )));
    final titleFinder = find.text("Google");
    final subtitleFinder = find.text("Google Subtitle");
    final iconDownFinder = find.byIcon(Icons.arrow_drop_down);
    final iconUpFinder = find.byIcon(Icons.arrow_drop_up);
    final contentFinder = find.text('Content');

    expect(titleFinder, findsOneWidget);
    expect(subtitleFinder, findsOneWidget);
    expect(iconDownFinder, findsOneWidget);
    expect(iconUpFinder, findsNothing);
    expect(contentFinder, findsNothing);

    await (tester.tap(iconDownFinder));
    await (tester.pumpAndSettle());

    expect(iconUpFinder, findsOneWidget);
    expect(iconDownFinder, findsNothing);
    expect(contentFinder, findsOneWidget);
    expect(titleFinder, findsOneWidget);
    expect(subtitleFinder, findsOneWidget);

    await (tester.tap(iconUpFinder));
    await (tester.pumpAndSettle());

    expect(titleFinder, findsOneWidget);
    expect(subtitleFinder, findsOneWidget);
    expect(iconDownFinder, findsOneWidget);
    expect(iconUpFinder, findsNothing);
    expect(contentFinder, findsNothing);
  });
}
