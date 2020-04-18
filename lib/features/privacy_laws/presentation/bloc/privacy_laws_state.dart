part of 'privacy_laws_bloc.dart';

abstract class PrivacyLawsState extends Equatable {
  PrivacyLawsState([List props = const <dynamic>[]]) : super(props);
}

class Initial extends PrivacyLawsState {}

class Loading extends PrivacyLawsState {}

class InternetError extends PrivacyLawsState{
  final LoginUser user;

  InternetError({@required this.user}): super([user]);
}

class Loaded extends PrivacyLawsState{
  final LoginUser user;
  final List<Laws> laws;

  Loaded({@required this.user,@required this.laws}): super([user,laws]);
}
