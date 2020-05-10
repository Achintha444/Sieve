part of 'login_signup_screen_bloc.dart';

abstract class LoginSignupScreenEvent extends Equatable {
  LoginSignupScreenEvent([List props = const <dynamic>[]]) : super(props);
}


class GetFacebookLoginEvent extends LoginSignupScreenEvent{}

class GetGoogleLoginEvent extends LoginSignupScreenEvent{
  final GoogleSignInAccount account;

  GetGoogleLoginEvent({@required this.account})
      : super([account]);
}