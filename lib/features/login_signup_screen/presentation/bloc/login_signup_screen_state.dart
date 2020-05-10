part of 'login_signup_screen_bloc.dart';

abstract class LoginSignupScreenState extends Equatable {
  LoginSignupScreenState([List props = const <dynamic>[]]) : super(props);
}

class Initial extends LoginSignupScreenState {}

class Loading extends LoginSignupScreenState{}

class InternetError extends LoginSignupScreenState{}

class Loaded extends LoginSignupScreenState{
  final LoginUser loginUser;

  Loaded({@required this.loginUser}): super([loginUser]);
}
