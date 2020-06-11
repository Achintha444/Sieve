import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/features/dashboard/presentation/widgets/initial_state_widget.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/dashboard/presentation/bloc/dashboard_bloc.dart';

class MockDashboardBloc extends Mock implements DashboardBloc {}

void main() {
  MockDashboardBloc mockDashboardBloc;

  final String id = '1';
  final String email = 'test1@gmail.com';
  final String password = 'Test@123';
  final String _imageUrl = 'www.google.com';
  final String _uid = '123';
  LoginUser loginUser;
  setUp(() {
    loginUser = new LoginUser(
        id: id,
        email: email,
        password: password,
        imageUrl: _imageUrl,
        uid: _uid);
    mockDashboardBloc = new MockDashboardBloc();
  });

  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: BlocProvider<DashboardBloc>(
          builder: (context) => mockDashboardBloc,
          child: Material(
            child: widget,
          ),
        ),
      ),
    );
  }

  testWidgets('Initial State Widget - Dashboard', (WidgetTester tester) async {
    //* Create the widget by telling the tester to build it.
    await tester.pumpWidget(buildTestableWidget(InitialStateWidget(
      user: loginUser,
    )));

    final circularProgressIndicatorFinder = find.byKey(Key('circularProgressIndicator'));

    expect(circularProgressIndicatorFinder, findsOneWidget);

    // Dispatch correct Event
    verify(mockDashboardBloc.dispatch(LoadDashboardEvent(user: loginUser)));
  });
}