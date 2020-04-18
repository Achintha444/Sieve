part of 'privacy_laws_bloc.dart';

abstract class PrivacyLawsEvent extends Equatable {
  PrivacyLawsEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadPrivacyLawsEvent extends PrivacyLawsEvent {
  final LoginUser user;

  LoadPrivacyLawsEvent({@required this.user}): super([user]);
}