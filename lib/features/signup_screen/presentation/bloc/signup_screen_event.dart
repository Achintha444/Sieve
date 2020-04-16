part of 'signup_screen_bloc.dart';

abstract class SignupScreenEvent extends Equatable {
 SignupScreenEvent([List props = const <dynamic>[]]) : super(props);
}

class GetSignupEvent extends SignupScreenEvent {
  final String email;
  final String password;

  GetSignupEvent({@required this.email, @required this.password})
      : super([email, password]);
}