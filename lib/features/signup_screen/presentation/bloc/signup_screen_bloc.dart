import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';

import '../../domain/usecases/get_signup.dart';

part 'signup_screen_event.dart';
part 'signup_screen_state.dart';

class SignupScreenBloc extends Bloc<SignupScreenEvent, SignupScreenState> {
  final GetSignup getSignup;

  SignupScreenBloc({@required this.getSignup});

  @override
  SignupScreenState get initialState => Initial();

  @override
  Stream<SignupScreenState> mapEventToState(
    SignupScreenEvent event,
  ) async* {
    if (event is GetSignupEvent) {
      yield Loading();
      final response = await this.getSignup([event.email, event.password]);
      yield* response.fold(
        (failure) async* {
          if (failure.runtimeType == InvalidInputFaliure) {
            yield InvalidInputError();
          } else if (failure.runtimeType == ServerFaliure) {
            yield ServerError();
          } else if (failure.runtimeType == InternetConnectionFaliure) {
            yield InternetError();
          }
        },
        (user) async* {
          yield Loaded();
        },
      );
    }
  }
}
