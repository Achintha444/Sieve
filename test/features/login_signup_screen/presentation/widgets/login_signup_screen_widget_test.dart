import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/features/login_signup_screen/presentation/bloc/login_signup_screen_bloc.dart';
import 'package:sieve_data_privacy_app/features/login_signup_screen/presentation/widgets/login_signup_screen_widget.dart';

class MockLoginSignupScreenBloc extends Mock implements LoginSignupScreenBloc {}

void main() {
  MockLoginSignupScreenBloc mockLoginSignupScreenBloc;

  setUp(() {
    mockLoginSignupScreenBloc = new MockLoginSignupScreenBloc();
  });

  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: BlocProvider<LoginSignupScreenBloc>(
          builder: (context) => mockLoginSignupScreenBloc,
          child: widget,
        ),
      ),
    );
  }

  final Key imageKey = Key('logo_image');
  final Key googleKey = Key('google_login');
  final Key fbKey = Key('fb_login');

  testWidgets('LoginSignupScreenWidget', (WidgetTester tester) async {
    //* Create the widget by telling the tester to build it.
    await tester.pumpWidget(buildTestableWidget(LoginSignupScreenWidget()));

    //* LoginSignupScreenWidger has the correct content
    final logoFinder = find.byKey(imageKey);
    final loginButtonFinder = find.text('LOGIN');
    final signupButtonFinder = find.text('SIGNUP');
    final googleButtonFinder = find.byKey(googleKey);
    final facebookButtonFinder = find.byKey(fbKey);

    expect(logoFinder, findsOneWidget);
    expect(loginButtonFinder, findsOneWidget);
    expect(signupButtonFinder, findsOneWidget);
    expect(googleButtonFinder, findsOneWidget);
    expect(facebookButtonFinder, findsOneWidget);

    //* should dispatch GetGoogleLoginEvent when google button tapped
    //! facebook_signin_widget is also tested here
    await tester.tap(googleButtonFinder);
    await tester.pump();
    verify(mockLoginSignupScreenBloc.dispatch(GetGoogleLoginEvent()));

    //* should dispatch GetGoogleLoginEvent when google button tapped
    //! google_signin_widget is also tested here
    await tester.tap(facebookButtonFinder);
    await tester.pump();
    verify(mockLoginSignupScreenBloc.dispatch(GetFacebookLoginEvent()));
  });
}
