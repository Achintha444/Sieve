part of 'privacy_tips_bloc.dart';

abstract class PrivacyTipsEvent extends Equatable {
  PrivacyTipsEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadPrivacyTipsEvent extends PrivacyTipsEvent {
  final LoginUser user;

  LoadPrivacyTipsEvent({@required this.user}): super([user]);
}