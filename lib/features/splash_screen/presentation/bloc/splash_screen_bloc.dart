import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/Usecase/use_case.dart';
import '../../domain/usecases/navigate_to_login_screen.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {

  final NavigateToLoginScreen navigateToMainScreen;

  SplashScreenBloc({@required this.navigateToMainScreen});

  @override
  SplashScreenState get initialState => Initial();

  @override
  Stream<SplashScreenState> mapEventToState(
    SplashScreenEvent event,
  ) async* {
    if (event is NavigateToLoginScreenEvent) {
      yield Loading();
      final response = await this.navigateToMainScreen.call(
            NoParams(),
          );
      yield response.fold(
        (faliure) => InternetError(),
        (_) => Loaded(),
      );
    }
  }
}
