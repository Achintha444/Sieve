import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/bottom_nav/presentation/widgets/loading_widget.dart';

void main() {
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

  testWidgets('BottomNavWidget', (WidgetTester tester) async {
    //* Create the widget by telling the tester to build it.
    await tester.pumpWidget(buildTestableWidget(LoadingWidget()));
    final circularProgressIndicatorFinder =
        find.byKey(Key('circularProgressIndicator'));
    expect(circularProgressIndicatorFinder, findsOneWidget);
  });
}
