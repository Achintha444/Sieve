part of 'privacy_policy_bloc.dart';

abstract class PrivacyPolicyState extends Equatable {
  PrivacyPolicyState([List props = const <dynamic>[]]) : super(props);
}

class Initial extends PrivacyPolicyState {}

class Loading extends PrivacyPolicyState {}

class InternetError extends PrivacyPolicyState{
  final LoginUser user;

  InternetError({@required this.user}): super([user]);
}

class Loaded extends PrivacyPolicyState{
  final LoginUser user;
  final PrivacyPolicy privacyPolicy;

  Loaded({@required this.user,@required this.privacyPolicy}): super([user,privacyPolicy]);
}
