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

  testWidgets('TitlePanel', (WidgetTester tester) async {
    final list = ['list1','list2'];
    await tester.pumpWidget(buildTestableWidget(PanelOne(list: list)));
    final listFinder = find.widgetWithIcon(ListTile,Icons.bookmark);

    expect(listFinder, findsNWidgets(list.length));
  });
}