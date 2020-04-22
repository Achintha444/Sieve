import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/features/signup_screen/presentation/bloc/signup_screen_bloc.dart';
import 'package:sieve_data_privacy_app/features/signup_screen/presentation/widgets/signup_screen_widget.dart';

class MockSignupScreenBloc extends Mock implements SignupScreenBloc {}

void main() {
  MockSignupScreenBloc mockSignupScreenBloc;

  setUp(() {
    mockSignupScreenBloc = new MockSignupScreenBloc();
  });

  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: BlocProvider<SignupScreenBloc>(
          builder: (context) => mockSignupScreenBloc,
          child: Material(
            child: widget,
          ),
        ),
      ),
    );
  }

  final Key signupKey = Key('Sign up');
  final Key signupButtonKey = Key('Signup_button');

  testWidgets('SignupScreenWidget', (WidgetTester tester) async {
    //* Create the widget by telling the tester to build it.
    await tester.pumpWidget(buildTestableWidget(SignupScreenWidget()));

    final signupFinder = find.byKey(signupKey);
    final emailTextFieldFinder =
        find.widgetWithText(TextFormField, 'Email'); // text('Email');
    final passwordTextFieldFinder =
        find.widgetWithText(TextFormField, 'Password');
    final rePasswordTextFieldFinder =
        find.widgetWithText(TextFormField, 'Re Enter Password');
    final signupButton = find.byKey(signupButtonKey);
    final loginFinder = find.text('login'.toUpperCase());

    expect(signupFinder, findsOneWidget);
    expect(emailTextFieldFinder, findsOneWidget);
    expect(passwordTextFieldFinder, findsOneWidget);
    expect(rePasswordTextFieldFinder, findsOneWidget);
    expect(signupButton, findsOneWidget);
    expect(loginFinder, findsOneWidget);

    //* should not dispatch GetSignupEvent when the signup tapped if
    //* there is an error in the email , password or rePassword

    // All fields are empty
    await tester.tap(signupButton);
    await tester.pump();
    verifyZeroInteractions(mockSignupScreenBloc);

    // enter invalind inputs
    await tester.tap(emailTextFieldFinder);
    await tester.enterText(emailTextFieldFinder, 'testgmail.com');
    await tester.tap(passwordTextFieldFinder);
    await tester.enterText(passwordTextFieldFinder, 'test@gmail.com');
    await tester.tap(rePasswordTextFieldFinder);
    await tester.enterText(rePasswordTextFieldFinder, 'test@gmail.com');
    await tester.tap(signupButton);
    await tester.pump();
    verifyZeroInteractions(mockSignupScreenBloc);

    // enter some empty fields
    await tester.tap(passwordTextFieldFinder);
    await tester.enterText(passwordTextFieldFinder, 'test@gmail.com');
    await tester.tap(rePasswordTextFieldFinder);
    await tester.enterText(rePasswordTextFieldFinder, 'test@gmail.com');
    await tester.tap(signupButton);
    await tester.pump();
    verifyZeroInteractions(mockSignupScreenBloc);

    // all are right types
    await tester.tap(emailTextFieldFinder);
    await tester.enterText(emailTextFieldFinder, 'test@gmail.com');
    await tester.tap(passwordTextFieldFinder);
    await tester.enterText(passwordTextFieldFinder, 'Test123@gmail.com');
    await tester.tap(rePasswordTextFieldFinder);
    await tester.enterText(rePasswordTextFieldFinder, 'Test123@gmail.com');
    await tester.tap(signupButton);
    await tester.pump();
   verify(mockSignupScreenBloc.dispatch(GetSignupEvent(email: 'test@gmail.com',password:  'Test123@gmail.com')));
  });
}
