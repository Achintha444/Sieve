import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/presentation/widgets/title_panel.dart';


void main() {
  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(home: Material(child: widget)),
    );
  }

  testWidgets('TitlePanel', (WidgetTester tester) async {
    final String title = 'Google';
    await tester.pumpWidget(buildTestableWidget(TitlePanel(title: title)));
    final titleFinder = find.widgetWithText(Container,title);

    expect(titleFinder, findsOneWidget);
  });
}
