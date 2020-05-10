import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/privacy_laws/presentation/widgets/laws_card.dart';
import 'package:sieve_data_privacy_app/features/privacy_tips/presentation/widgets/tips_card.dart';

void main() {
  final String title = 'test@gmail.com';
  final String desc = 'Test@123';
  final String full_link = 'www.test.com';

  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: Material(
          child: widget,
        ),
      ),
    );
  }

  testWidgets('Laws Card Widget', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(LawsCard(
      desc: desc,
      title: title,
      link: full_link,
    )));

    final descFinder = find.text(desc);
    final titleFinder = find.text(title);
    final linkFinder = find.text('view the full description');

    expect(descFinder, findsOneWidget);
    expect(titleFinder, findsOneWidget);
    expect(linkFinder, findsOneWidget);

    await tester.tap(linkFinder);
    await tester.pumpAndSettle();
  });
}
