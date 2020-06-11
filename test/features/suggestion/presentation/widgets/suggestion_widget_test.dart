import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/suggestion/presentation/bloc/suggestion_bloc.dart';
import 'package:sieve_data_privacy_app/features/suggestion/presentation/widgets/suggestion_widget.dart';

class MockSuggestionBloc extends Mock implements SuggestionBloc {}

class MockLoginUser extends Mock implements LoginUser {}

void main() {
  MockSuggestionBloc mockSuggestionBloc;
  MockLoginUser mockLoginUser;

  setUp(() {
    mockSuggestionBloc = new MockSuggestionBloc();
    mockLoginUser = new MockLoginUser();
  });

  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: BlocProvider<SuggestionBloc>(
          builder: (context) => mockSuggestionBloc,
          child: Material(
            child: widget,
          ),
        ),
      ),
    );
  }

  testWidgets('SuggestionWidet', (WidgetTester tester) async {
    await tester.pumpWidget(
      buildTestableWidget(
        SuggestionWidget(user: mockLoginUser),
      ),
    );

    //* SuggestionWidget has the correct content
    final titleFinder = find.text('Suggestions are always welcome!');
    final textFormFinder = find.byKey(Key('text_filed'));
    final buttonFinder = find.byKey(Key('suggestion_button'));

    expect(titleFinder, findsOneWidget);
    expect(textFormFinder, findsOneWidget);
    expect(buttonFinder, findsOneWidget);

    //* Suggestion should not send if the suggestion is empty
    await tester.tap(textFormFinder);
    await tester.enterText(textFormFinder, '');
    await tester.tap(buttonFinder);
    await tester.pump();
    verifyZeroInteractions(mockSuggestionBloc);
    expect(find.text('Suggestions Cannot be Empty Right 😉'), findsOneWidget);

    //* Suggestion should sent if it's not empty
    await tester.tap(textFormFinder);
    await tester.enterText(textFormFinder, 'Suggestion');
    await tester.tap(buttonFinder);
    await tester.pump();
    verify(mockSuggestionBloc.dispatch(SentSuggestionEvent(
        suggestion: 'Suggestion', loginUser: mockLoginUser)));
  
  });
}
