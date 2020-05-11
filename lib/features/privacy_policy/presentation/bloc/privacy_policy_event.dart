part of 'privacy_policy_bloc.dart';

abstract class PrivacyPolicyEvent extends Equatable {
  PrivacyPolicyEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadPrivacyPolicyEvent extends PrivacyPolicyEvent {
  final LoginUser user;
  final String appId;

  LoadPrivacyPolicyEvent({@required this.user, @required this.appId}): super([user]);
}