import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sieve_data_privacy_app/features/categories/domain/entities/apps.dart';
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
    final LoginUser user = new LoginUser(
        id: '1',
        email: 'temp@gmail.com',
        password: 'Temp@123',
        uid: '123',
        imageUrl: 'www.google.com');
    final String contactLink = 'www.google.com';
    final String email = 'temp@gmail.com';
    final String fiLine = 'fi line';
    final String sLine = 's line';
    final String tLine = 't line';
    final String foLine = 'fo line';
    final App app = new App(
        id: 1,
        name: 'Google',
        desc: 'Small Google dESC',
        icon: 'www.google.com',
        bg: 'www.google.com',
        link: 'www.google.com');

    await tester.pumpWidget(buildTestableWidget(PanelPrivacyOfficer(
      contactLink: contactLink,
      email: email,
      fiLine: fiLine,
      foLine: foLine,
      sLine: sLine,
      tLine: tLine,
      user: user,
      app: app,
    )));
    final titleFinder = find.text(
        "Having any problems related to the privacy policy of Google ?");
    final emailFinder = find.text(
        'Click here to send an email to Google about it');
    final messageFinder = find.text(
        "Click here to send a message through Google's website");
    final snailMailFinder =
        find.text("Contact through snail mail");

    expect(titleFinder, findsOneWidget);
    expect(emailFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
    expect(snailMailFinder, findsOneWidget);
  });
}
