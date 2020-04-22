import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/features/bottom_nav/presentation/bloc/bottom_nav_bloc.dart';
import 'package:sieve_data_privacy_app/features/bottom_nav/presentation/widgets/initial_state_widget.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

class MockBottomNavBloc extends Mock implements BottomNavBloc {}

void main() {
  MockBottomNavBloc mockBottomNavBloc;

  final String email = 'test@gmail.com';
  final String password = 'Test@123';
  final String id = '1';
  LoginUser loginUser;
  setUp(() {
    loginUser = new LoginUser(id: id, email: email, password: password);
    mockBottomNavBloc = new MockBottomNavBloc();
  });

  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: BlocProvider<BottomNavBloc>(
          builder: (context) => mockBottomNavBloc,
          child: Material(
            child: widget,
          ),
        ),
      ),
    );
  }

  testWidgets('BottomNavWidget', (WidgetTester tester) async {
    //* Create the widget by telling the tester to build it.
    await tester.pumpWidget(buildTestableWidget(InitialStateWidget(
      user: loginUser,
    )));

    final circularProgressIndicatorFinder = find.byKey(Key('circularProgressIndicator'));
    
    expect(circularProgressIndicatorFinder, findsOneWidget);
    
    // Dispatch correct Event
    verify(mockBottomNavBloc.dispatch(NewsFeedEvent(user: loginUser)));
  });
}
