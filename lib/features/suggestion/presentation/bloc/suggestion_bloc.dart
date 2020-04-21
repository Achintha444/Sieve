import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/features/suggestion/domain/usecases/send_suggestion.dart';

import '../../../login_screen/domain/entities/login_user.dart';

part 'suggestion_event.dart';
part 'suggestion_state.dart';

class SuggestionBloc extends Bloc<SuggestionEvent, SuggestionState> {
  final SendSuggestion sendSuggestion;

  SuggestionBloc({@required this.sendSuggestion});

  @override
  SuggestionState get initialState => Initial();

  @override
  Stream<SuggestionState> mapEventToState(
    SuggestionEvent event,
  ) async* {
    if (event is SentSuggestionEvent) {
      yield Loading();
      print(event.loginUser.email);
      print(event.suggestion);
      print(sendSuggestion.toString());
      final response = await this.sendSuggestion([event.loginUser, event.suggestion]);
      print (response);
      yield* response.fold(
        (failure) async* {
          if (failure.runtimeType == InvalidInputFaliure) {
            yield InvalidInputError();
          } else if (failure.runtimeType == ServerFaliure) {
            yield ServerError();
          } else if (failure.runtimeType == InternetConnectionFaliure) {
            yield InternetError(loginUser: event.loginUser);
          }
        },
        (user) async* {
          yield Loaded(loginUser: event.loginUser);
        },
      );
    }
  }
}
