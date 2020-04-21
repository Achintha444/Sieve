import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:sieve_data_privacy_app/features/signup_screen/presentation/bloc/signup_screen_bloc.dart';
import 'package:sieve_data_privacy_app/features/signup_screen/presentation/widgets/signup_screen_widget.dart';

class MockSignupScreenBloc extends Mock implements SignupScreenBloc {}

void main() {
  MockSignupScreenBloc mockSignupScreenBloc;

  setUp(() {
    mockSignupScreenBloc = new MockSignupScreenBloc();
  });

  Widget buildTestableWidget(Widget widget) {
    return MediaQuery(
      data: MediaQueryData(),
      child: MaterialApp(
        home: BlocProvider<SignupScreenBloc>(
          builder: (context) => mockSignupScreenBloc,
          child: Material(
            child: widget,
          ),
        ),
      ),
    );
  }

  testWidgets('SignupScreenWidget', (WidgetTester tester) async {
    //* Create the widget by telling the tester to build it.
      await tester.pumpWidget(buildTestableWidget(SignupScreenWidget()));
  });
}
