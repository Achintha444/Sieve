part of 'suggestion_bloc.dart';

abstract class SuggestionState extends Equatable {
  SuggestionState([List props = const <dynamic>[]]) : super(props);
}

class SuggestionInitial extends SuggestionState {
  @override
  List<Object> get props => [];
}
