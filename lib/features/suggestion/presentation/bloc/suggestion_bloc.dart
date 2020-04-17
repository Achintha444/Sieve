import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'suggestion_event.dart';
part 'suggestion_state.dart';

class SuggestionBloc extends Bloc<SuggestionEvent, SuggestionState> {
  @override
  SuggestionState get initialState => SuggestionInitial();

  @override
  Stream<SuggestionState> mapEventToState(
    SuggestionEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
