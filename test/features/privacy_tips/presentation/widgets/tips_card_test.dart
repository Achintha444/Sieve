import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/privacy_tips/presentation/widgets/tips_card.dart';

void main() {
  final String title = 'test@gmail.com';
  final String desc = 'Test@123';

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

  testWidgets('Tips Card Widget', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(TipsCard(desc: desc, title: title)));

    final descFinder = find.text(desc);
    final titleFinder = find.text(title);

    expect(descFinder, findsOneWidget);
    expect(titleFinder, findsOneWidget);


  });
}
