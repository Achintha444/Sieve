import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/interesting_news/presentation/widgets/news_card.dart';

void main() {
  final String title = 'test@gmail.com';
  final String desc = 'Test@123';
  final String link='testfulllink';

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

  testWidgets('News Card Widget', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(NewsCard(
      desc: desc,
      title: title,
      link: link,
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