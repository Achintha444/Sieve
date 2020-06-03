import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:sieve_data_privacy_app/core/Constants/search_floating_button.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

class MockLoginUser extends Mock implements LoginUser {}

void main() {
  MockLoginUser user;

  setUp(() {
    user = new MockLoginUser();
  });

  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: widget,
      ),
    );
  }

  testWidgets('SearchFloatingButton Widget Test', (WidgetTester tester) async {
    //* Create the widget by telling the tester to build it.
    await tester.pumpWidget(buildTestableWidget(SearchFloatingButton(
      user: user,
    )));

    //* RefreshFloatingButton has the correct content
    final searchFinder = find.byKey(Key('app-search'));

    expect(searchFinder, findsOneWidget);
  });
}
