import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sieve_data_privacy_app/core/Usecase/use_case.dart';
import '../../domain/usecases/get_facebook_login.dart';
import '../../domain/usecases/get_google_login.dart';
import '../../domain/usecases/get_login.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  final GetFacebookLogin getFacebookLogin;
  final GetGoogleLogin getGoogleLogin;
  final GetLogin getLogin;

  LoginScreenBloc(
      {@required this.getFacebookLogin,
      @required this.getGoogleLogin,
      @required this.getLogin});

  @override
  LoginScreenState get initialState => Initial();

  @override
  Stream<LoginScreenState> mapEventToState(
    LoginScreenEvent event,
  ) async* {
    if (event is GetLoginEvent) {
      yield Loading();
      final response = await this.getLogin([event.email, event.password]);
      yield* response.fold(
        (failure) async* {
          yield InternetError();
        },
        (user) async* {
          print (user.getEmail);
          print (user.getPassword);
          yield Loaded();
        },
      );
    } else if (event is GetGoogleLoginEvent) {
      yield Loading();
      final response = await this.getGoogleLogin(NoParams());
      yield* response.fold(
        (failure) async* {
          yield InternetError();
        },
        (user) async* {
          yield Loaded();
        },
      );
    } else if (event is GetFacebookLoginEvent) {
      yield Loading();
      final response = await this.getFacebookLogin(NoParams());
      yield* response.fold(
        (failure) async* {
          yield InternetError();
        },
        (user) async* {
          yield Loaded();
        },
      );
    }
  }
}
