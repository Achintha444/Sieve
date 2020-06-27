import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/presentation/widgets/panel_full_link.dart';

void main() {
  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(home: Material(child: widget)),
    );
  }

  testWidgets('Panel Full Link - With Link', (WidgetTester tester) async {
    await tester
        .pumpWidget(buildTestableWidget(PanelFullLink(link: 'www.google.com')));
    final textFinder =
        find.text('Click the link below to view the full privacy policy');
    final buttonFinder = find.text('full link');
    //final failedTextFinder = find.text('Something went wrong\nTry again'.toUpperCase());

    expect(textFinder, findsOneWidget);
    expect(buttonFinder, findsOneWidget);

    await(tester.tap(buttonFinder));
    await(tester.pumpAndSettle());
    //expect(failedTextFinder, findsOneWidget);
  });

  // testWidgets('Panel Full Link - Without Link', (WidgetTester tester) async {
  //   await tester
  //       .pumpWidget(buildTestableWidget(PanelFullLink(link: null)));
  //   final textFinder =
  //       find.text('No Privacy Available available!');

  //   expect(textFinder, findsOneWidget);
  // });
}
