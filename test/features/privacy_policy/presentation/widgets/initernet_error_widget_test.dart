import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/presentation/widgets/internet_error_widget.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/presentation/bloc/privacy_policy_bloc.dart';

class MockPrivacyPolicyBloc extends Mock implements PrivacyPolicyBloc {}

void main() {
  MockPrivacyPolicyBloc mockPrivacyPolicyBloc;

  final String email = 'test@gmail.com';
  final String password = 'Test@123';
  final String id = '1';
  LoginUser loginUser;
  PrivacyPolicyEvent event;
  setUp(() {
    loginUser = new LoginUser(id: id, email: email, password: password);
    mockPrivacyPolicyBloc = new MockPrivacyPolicyBloc();
    event = new LoadPrivacyPolicyEvent(appId: '1',user: loginUser);
  });

  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: BlocProvider<PrivacyPolicyBloc>(
          builder: (context) => mockPrivacyPolicyBloc,
          child: Material(
            child: widget,
          ),
        ),
      ),
    );
  }

  testWidgets('InternetErrorWidget', (WidgetTester tester) async {
    //* Create the widget by telling the tester to build it.
    await tester.pumpWidget(buildTestableWidget(InternetErrorWidget(
      user: loginUser,
      appId: '1',
    )));

    final noInternetText = find.text('NO INTERNET'.toUpperCase());
    final connectionText = find.text('connection'.toUpperCase());
    final otherText = find.text('Connect to internet and try again'.toUpperCase());
    final floatingActionButton = find.byIcon(Icons.replay);

    expect(noInternetText, findsOneWidget);
    expect(connectionText, findsOneWidget);
    expect(otherText, findsOneWidget);
    expect(floatingActionButton, findsOneWidget);
    
    
    // Dispatch correct Event
    await tester.tap(floatingActionButton);
    await tester.pump();
    verify(mockPrivacyPolicyBloc.dispatch(event));
  });
}
