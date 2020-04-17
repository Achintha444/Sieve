part of 'suggestion_bloc.dart';

abstract class SuggestionState extends Equatable {
  SuggestionState([List props = const <dynamic>[]]) : super(props);
}

class Initial extends SuggestionState {}

class Loading extends SuggestionState{}

class ServerError extends SuggestionState{}

class InvalidInputError extends SuggestionState{}

class InternetError extends SuggestionState{
  final LoginUser loginUser;

  InternetError({@required this.loginUser}): super([loginUser]);
}

class Loaded extends SuggestionState{
  final LoginUser loginUser;

  Loaded({@required this.loginUser}): super([loginUser]);
}
