import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_signup_screen_event.dart';
part 'login_signup_screen_state.dart';

class LoginSignupScreenBloc extends Bloc<LoginSignupScreenEvent, LoginSignupScreenState> {
  @override
  LoginSignupScreenState get initialState => Initial();

  @override
  Stream<LoginSignupScreenState> mapEventToState(
    LoginSignupScreenEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
