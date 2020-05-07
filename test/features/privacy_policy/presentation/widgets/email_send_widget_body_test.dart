import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/presentation/widgets/email_send_widget_body.dart';

void main() {
  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: Material(
          child: SingleChildScrollView(
            child: Container(
              child: Center(
                child: widget,
              ),
            ),
          ),
        ),
      ),
    );
  }

  testWidgets('EmailSendWidgetBody', (WidgetTester tester) async {
    final String email = 'temp@gmail.com';
    await tester
        .pumpWidget(buildTestableWidget(EmailSendWidgetBody(email: email)));

    final titleFinder =
        find.text('Send an email to the privacy officer');
    final subjectFinder = find.text('Subject');
    final bodyFinder = find.text('Body');
    final sendEmailFinder = find.text('SEND EMAIL');

    expect(titleFinder, findsOneWidget);
    expect(subjectFinder, findsOneWidget);
    expect(bodyFinder, findsOneWidget);
    expect(sendEmailFinder, findsOneWidget);
  });
}
