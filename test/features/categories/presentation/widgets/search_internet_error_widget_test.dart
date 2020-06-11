import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/features/categories/presentation/bloc/apps_search_bloc.dart';
import 'package:sieve_data_privacy_app/features/categories/presentation/widgets/search_internet_error_widget.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

class MockAppsSearchBloc extends Mock implements AppsSearchBloc {}

void main() {
  MockAppsSearchBloc mockAppsSearchBloc;

  final String email = 'test@gmail.com';
  final String password = 'Test@123';
  final String id = '1';
  final String _imageUrl = 'www.google.com';
  final String _uid = '123';
  LoginUser loginUser;
  AppsSearchEvent event;
  setUp(() {
    loginUser = new LoginUser(id: id, email: email, password: password,imageUrl: _imageUrl,uid: _uid);
    mockAppsSearchBloc = new MockAppsSearchBloc();
    event = new LoadAppsSearchEvent(user: loginUser);
  });

  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: BlocProvider<AppsSearchBloc>(
          builder: (context) => mockAppsSearchBloc,
          child: Material(
            child: widget,
          ),
        ),
      ),
    );
  }

  testWidgets('InternetErrorWidget - AppsSearch', (WidgetTester tester) async {
    //* Create the widget by telling the tester to build it.
    await tester.pumpWidget(buildTestableWidget(SearchInternetErrorWidget(
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
    verify(mockAppsSearchBloc.dispatch(event));
  });
}
