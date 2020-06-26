part of 'login_screen_bloc.dart';

abstract class LoginScreenState extends Equatable {
  LoginScreenState([List props = const <dynamic>[]]) : super(props);
}

class Initial extends LoginScreenState {}

class Loading extends LoginScreenState{}

class ServerError extends LoginScreenState{}

class InvalidInputError extends LoginScreenState{}

class InternetError extends LoginScreenState{}

class UserBlockedError extends LoginScreenState{}

class Loaded extends LoginScreenState{
  final LoginUser loginUser;

  Loaded({@required this.loginUser}): super([loginUser]);
}
