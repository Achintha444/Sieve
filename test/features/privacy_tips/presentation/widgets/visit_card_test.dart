import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/privacy_tips/presentation/widgets/visit_card.dart';

void main() {
  List<String> links;

  setUp(() {
    links = ['www.test1.com', 'www.test1.com', 'www.test1.com'];
  });

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

  testWidgets('Visit Card Widget', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(VistCard(
      links: links,
    )));

    final visitTextFinder = find.text('Visit');
    final cardFinders = find.byType(GestureDetector);

    expect(visitTextFinder, findsOneWidget);
    expect(cardFinders, findsNWidgets(links.length));
  });
}
