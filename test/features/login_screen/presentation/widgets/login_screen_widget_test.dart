import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/features/login_screen/presentation/bloc/login_screen_bloc.dart';
import 'package:sieve_data_privacy_app/features/login_screen/presentation/widgets/login_screen_widget.dart';

class MockLoginScreenBloc extends Mock implements LoginScreenBloc {}

void main() {
  MockLoginScreenBloc mockLoginScreenBloc;

  setUp(() {
    mockLoginScreenBloc = new MockLoginScreenBloc();
  });

  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: BlocProvider<LoginScreenBloc>(
          builder: (context) => mockLoginScreenBloc,
          child: Material(
            child: widget,
          ),
        ),
      ),
    );
  }

  final Key loginKey = Key('login');
  final Key loginButtonKey = Key('login_button');
  final Key googleKey = Key('google_login');
  final Key fbKey = Key('fb_login');

  testWidgets(
    'LoginScreenWidget',
    (WidgetTester tester) async {
      //* Create the widget by telling the tester to build it.
      await tester.pumpWidget(buildTestableWidget(LoginScreenWidget()));

      //* LoginSignupScreenWidger has the correct content
      final loginFinder = find.byKey(loginKey);
      final emailTextFieldFinder =
          find.widgetWithText(TextFormField, 'Email'); // text('Email');
      final passwordTextFieldFinder =
          find.widgetWithText(TextFormField, 'Password');
      final loginButton = find.byKey(loginButtonKey);
      final googleButtonFinder = find.byKey(googleKey);
      final facebookButtonFinder = find.byKey(fbKey);
      final signupFinder = find.text('SIGN UP'.toUpperCase());

      expect(loginFinder, findsOneWidget);
      expect(emailTextFieldFinder, findsOneWidget);
      expect(passwordTextFieldFinder, findsOneWidget);
      expect(loginButton, findsOneWidget);
      expect(googleButtonFinder, findsOneWidget);
      expect(facebookButtonFinder, findsOneWidget);
      expect(signupFinder, findsOneWidget);

      //* should not dispatch GetLoginEvent when login button tapped when there is error in the emails and the password

      // Both Empty
      await tester.tap(loginButton);
      await tester.pump();
      verifyZeroInteractions(mockLoginScreenBloc);

      // Both Wrong Type
      await tester.tap(emailTextFieldFinder);
      await tester.enterText(emailTextFieldFinder, 'test@gmail.com');
      await tester.tap(passwordTextFieldFinder);
      await tester.enterText(passwordTextFieldFinder, 'test@gmail.com');
      await tester.tap(loginButton);
      await tester.pump();
      verifyZeroInteractions(mockLoginScreenBloc);

      // Password Wrong Type
      await tester.tap(emailTextFieldFinder);
      await tester.enterText(emailTextFieldFinder, 'test@gmail.com');
      await tester.tap(loginButton);
      await tester.pump();
      verifyZeroInteractions(mockLoginScreenBloc);

      // Email Wrong Type
      await tester.tap(passwordTextFieldFinder);
      await tester.enterText(passwordTextFieldFinder, 'test@gmail.com');
      await tester.tap(loginButton);
      await tester.pump();
      verifyZeroInteractions(mockLoginScreenBloc);

      // Both Right Type
      await tester.tap(emailTextFieldFinder);
      await tester.enterText(emailTextFieldFinder, 'test@gmail.com');
      await tester.tap(passwordTextFieldFinder);
      await tester.enterText(passwordTextFieldFinder, 'Test123@gmail.com');
      await tester.tap(loginButton);
      await tester.pump();
      verify(mockLoginScreenBloc.dispatch(GetLoginEvent(email: 'test@gmail.com',password:  'Test123@gmail.com')));
     // verifyZeroInteractions(mockLoginScreenBloc);

      //* should dispatch GetGoogleLoginEvent when google button tapped
      await tester.tap(googleButtonFinder);
      await tester.pump();
      verify(mockLoginScreenBloc.dispatch(GetGoogleLoginEvent()));

      //* should dispatch GetFacebookLoginEvent when Facebook button tapped
      await tester.tap(facebookButtonFinder);
      await tester.pump();
      verify(mockLoginScreenBloc.dispatch(GetFacebookLoginEvent()));
    },
  );
}

