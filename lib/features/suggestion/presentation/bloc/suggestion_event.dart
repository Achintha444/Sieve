part of 'suggestion_bloc.dart';

abstract class SuggestionEvent extends  Equatable {
  SuggestionEvent([List props = const <dynamic>[]]) : super(props);
}

class SentSuggestionEvent extends SuggestionEvent {
  final String suggestion;
  final LoginUser loginUser;

  SentSuggestionEvent({@required this.suggestion, @required this.loginUser}): super([suggestion,loginUser]);
}