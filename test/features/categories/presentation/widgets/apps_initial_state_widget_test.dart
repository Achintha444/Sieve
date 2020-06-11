import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/features/categories/presentation/bloc/apps_bloc.dart';
import 'package:sieve_data_privacy_app/features/categories/presentation/widgets/apps_initial_state_widget.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

class MockAppsBloc extends Mock implements AppsBloc {}

void main() {
  MockAppsBloc mockAppsBloc;

  final String email = 'test@gmail.com';
  final String password = 'Test@123';
  final String id = '1';
  final String _imageUrl = 'www.google.com';
  final String _uid = '123';
  LoginUser loginUser;
  setUp(() {
    loginUser = new LoginUser(id: id, email: email, password: password,imageUrl: _imageUrl,uid: _uid);
    mockAppsBloc = new MockAppsBloc();
  });

  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: BlocProvider<AppsBloc>(
          builder: (context) => mockAppsBloc,
          child: Material(
            child: widget,
          ),
        ),
      ),
    );
  }

  testWidgets('InitialStateWidget - Apps', (WidgetTester tester) async {
    //* Create the widget by telling the tester to build it.
    await tester.pumpWidget(buildTestableWidget(AppsInitialStateWidget(
      user: loginUser, categoryId: 1,
    )));

    final circularProgressIndicatorFinder = find.byKey(Key('circularProgressIndicator'));

    expect(circularProgressIndicatorFinder, findsOneWidget);

    // Dispatch correct Event
    verify(mockAppsBloc.dispatch(LoadAppsEvent(user: loginUser, categoryId: 1)));
  });
}
