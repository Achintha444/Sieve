import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/features/categories/presentation/bloc/categories_bloc.dart';
import 'package:sieve_data_privacy_app/features/categories/presentation/widgets/internet_error_widget.dart';
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
  CategoriesEvent event;
  setUp(() {
    loginUser = new LoginUser(id: id, email: email, password: password,imageUrl: _imageUrl,uid: _uid);
    mockCategoriesBloc = new MockCategoriesBloc();
    event = new LoadCategoriesEvent(user: loginUser);
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

  testWidgets('InternetErrorWidget - Categories', (WidgetTester tester) async {
    //* Create the widget by telling the tester to build it.
    await tester.pumpWidget(buildTestableWidget(InternetErrorWidget(
      user: loginUser,
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
    verify(mockCategoriesBloc.dispatch(event));
  });
}
