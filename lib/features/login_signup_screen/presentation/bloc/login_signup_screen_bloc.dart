import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:sieve_data_privacy_app/core/Usecase/use_case.dart';
import '../../domain/usecases/get_facebook_login.dart';
import '../../domain/usecases/get_google_login.dart';

part 'login_signup_screen_event.dart';
part 'login_signup_screen_state.dart';

class LoginSignupScreenBloc
    extends Bloc<LoginSignupScreenEvent, LoginSignupScreenState> {
  final GetFacebookLogin getFacebookLogin;
  final GetGoogleLogin getGoogleLogin;

  LoginSignupScreenBloc({
    @required this.getFacebookLogin,
    @required this.getGoogleLogin,
  });

  @override
  LoginSignupScreenState get initialState => Initial();

  @override
  Stream<LoginSignupScreenState> mapEventToState(
    LoginSignupScreenEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is GetFacebookLoginEvent) {
      yield Loading();
      final response = await getFacebookLogin(NoParams());

      yield* response.fold((faliure) async* {
        yield InternetError();
      }, (user) async* {
        yield Loaded();
      });
    }
    if (event is GetGoogleLoginEvent) {
      yield Loading();
      final response = await getGoogleLogin(NoParams());

      yield* response.fold((faliure) async* {
        yield InternetError();
      }, (user) async* {
        yield Loaded();
      });
    }
  }
}
