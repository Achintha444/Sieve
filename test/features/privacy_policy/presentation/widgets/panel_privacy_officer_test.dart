import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/presentation/widgets/panel_privacy_officer.dart';

void main() {
  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(home: Material(child: widget)),
    );
  }

  testWidgets('PanelPrivacyOfficer', (WidgetTester tester) async {
    final LoginUser user =
        new LoginUser(id: '1', email: 'temp@gmail.com', password: 'Temp@123',uid: '123',imageUrl: 'www.google.com');
    final String contactLink = 'www.google.com';
    final String email = 'temp@gmail.com';
    final String fiLine = 'fi line';
    final String sLine = 's line';
    final String tLine = 't line';
    final String foLine = 'fo line';
    await tester.pumpWidget(buildTestableWidget(PanelPrivacyOfficer(
      contactLink: contactLink,
      email: email,
      fiLine: fiLine,
      foLine: foLine,
      sLine: sLine,
      tLine: tLine,
      user: user,
    )));
    final titleFinder = find.widgetWithText(
        ListTile, "Have any problems related to Google's privacy policy ?");
    final emailFinder = find.widgetWithText(
        ListTile, 'Click here to send an email to Google about it');
    final messageFinder = find.widgetWithText(
        ListTile, "Click here to send a message through Google's website");
    final snailMailFinder = find.widgetWithText(
        ListTile, "Contact through snail mail");

    expect(titleFinder, findsOneWidget);
    expect(emailFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
    expect(snailMailFinder, findsOneWidget);
  });
}
