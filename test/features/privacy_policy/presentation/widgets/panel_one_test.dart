import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/presentation/widgets/panel_one.dart';

void main() {
  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(home: Material(child: widget)),
    );
  }

  testWidgets('Panel One - With List', (WidgetTester tester) async {
    final list = ['list1', 'list2'];
    await tester.pumpWidget(buildTestableWidget(PanelOne(list: list)));
    final listFinder = find.widgetWithIcon(Container, Icons.lens);
    final listTxtFinder = find.text(list[0]);
    final listTextFinder2 = find.text(list[1]);

    expect(listFinder, findsNWidgets(list.length));
    expect(listTxtFinder, findsOneWidget);
    expect(listTextFinder2, findsOneWidget);
  });

  testWidgets('Panel One - Without List', (WidgetTester tester) async {
    await tester.pumpWidget(buildTestableWidget(PanelOne(list: [])));
    final txtFinder = find.text('No details available!');

    expect(txtFinder, findsOneWidget);
  });
}
