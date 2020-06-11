import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/features/categories/presentation/widgets/initial_state_widget.dart';
import 'package:sieve_data_privacy_app/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

class MockCategoriesBloc extends Mock implements CategoriesBloc {}

void main() {
  MockCategoriesBloc mockCategoriesBloc;

  final String email = 'test@gmail.com';
  final String password = 'Test@123';
  final String id = '1';
  final String _imageUrl = 'www.google.com';
  final String _uid = '123';
  LoginUser loginUser;
  setUp(() {
    loginUser = new LoginUser(id: id, email: email, password: password,imageUrl: _imageUrl,uid: _uid);
    mockCategoriesBloc = new MockCategoriesBloc();
  });

  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: BlocProvider<CategoriesBloc>(
          builder: (context) => mockCategoriesBloc,
          child: Material(
            child: widget,
          ),
        ),
      ),
    );
  }

  testWidgets('InitialStateWidget - Categories', (WidgetTester tester) async {
    //* Create the widget by telling the tester to build it.
    await tester.pumpWidget(buildTestableWidget(InitialStateWidget(
      user: loginUser,
    )));

    final circularProgressIndicatorFinder = find.byKey(Key('circularProgressIndicator'));

    expect(circularProgressIndicatorFinder, findsOneWidget);

    // Dispatch correct Event
    verify(mockCategoriesBloc.dispatch(LoadCategoriesEvent(user: loginUser)));
  });
}
