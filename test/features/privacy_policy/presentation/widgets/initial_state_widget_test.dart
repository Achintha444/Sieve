import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/presentation/widgets/initial_state_widget.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/presentation/bloc/privacy_policy_bloc.dart';

class MockPrivacyPolicyBloc extends Mock implements PrivacyPolicyBloc {}

void main() {
  MockPrivacyPolicyBloc mockPrivacyPolicyBloc;

  final String email = 'test@gmail.com';
  final String password = 'Test@123';
  final String id = '1';
  final String imageUrl = 'www.google.com';
  final String uid = '123'; 
  LoginUser loginUser;
  setUp(() {
    loginUser =  new LoginUser(id: id, email: email, password: password,imageUrl: imageUrl,uid: uid);
    mockPrivacyPolicyBloc = new MockPrivacyPolicyBloc();
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

  testWidgets('InitialStateWidget', (WidgetTester tester) async {
    //* Create the widget by telling the tester to build it.
    await tester.pumpWidget(buildTestableWidget(InitialStateWidget(
      user: loginUser,
      appId: '1',
    )));

    final circularProgressIndicatorFinder = find.byKey(Key('circularProgressIndicator'));
    
    expect(circularProgressIndicatorFinder, findsOneWidget);
    
    // Dispatch correct Event
    verify(mockPrivacyPolicyBloc.dispatch(LoadPrivacyPolicyEvent(appId: '1', user: loginUser)));
  });
}
