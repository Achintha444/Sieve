part of 'privacy_tips_bloc.dart';

abstract class PrivacyTipsState extends Equatable {
  PrivacyTipsState([List props = const <dynamic>[]]) : super(props);
}

class Initial extends PrivacyTipsState {}

class Loading extends PrivacyTipsState {}

class InternetError extends PrivacyTipsState{
  final LoginUser user;

  InternetError({@required this.user}): super([user]);
}

class Loaded extends PrivacyTipsState{
  final LoginUser user;
  final List<Tips> tips;

  Loaded({@required this.user,@required this.tips}): super([user,tips]);
}