import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sieve_data_privacy_app/core/Constants/refresh_floating_button.dart';


void main() {

  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: widget,
      ),
    );
  }

  testWidgets('RefreshFloatingButton Widget Test', (WidgetTester tester) async {
    //* Create the widget by telling the tester to build it.
    await tester.pumpWidget(buildTestableWidget(RefreshFloatingButton(onTap: (){
      print ('refresh button clicked');
    })));

    //* RefreshFloatingButton has the correct content
    final refreshFinder = find.byKey(Key('refresh'));

    expect(refreshFinder, findsOneWidget);
    
    //* should call the function that we provided in the constructor
    await tester.tap(refreshFinder);
    await tester.pumpAndSettle();
    expect(refreshFinder, findsOneWidget);
  });
}
