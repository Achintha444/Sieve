import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/Usecase/use_case.dart';
import '../../../../core/error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/usecases/auto_login.dart';
import '../../domain/usecases/navigate_to_login_screen.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  final NavigateToLoginScreen navigateToMainScreen;
  final AutoLogin autoLogin;

  SplashScreenBloc(
      {@required this.navigateToMainScreen, @required this.autoLogin});

  @override
  SplashScreenState get initialState => Initial();

  @override
  Stream<SplashScreenState> mapEventToState(
    SplashScreenEvent event,
  ) async* {
    if (event is NavigateToLoginScreenEvent) {
      yield Loading();
      final user = await this.autoLogin.call(NoParams());
      yield* user.fold((faliure) async* {
        if (faliure.runtimeType == CacheFaliure) {
          final response = await this.navigateToMainScreen.call(NoParams());
          yield response.fold(
            (faliure) => InternetError(),
            (_) => Loaded(),
          );
        } else if (faliure.runtimeType == InternetConnectionFaliure) {
          yield InternetError();
        }
      }, (user) async* {
        yield LoadedUser(loginUser: user);
      });
    }
  }
}
