part of 'signup_screen_bloc.dart';

abstract class SignupScreenState extends Equatable {
  SignupScreenState([List props = const <dynamic>[]]) : super(props);
}

class Initial extends SignupScreenState {}

class Loading extends SignupScreenState{}

class ServerError extends SignupScreenState{}

class InvalidInputError extends SignupScreenState{}

class InternetError extends SignupScreenState{}

class Loaded extends SignupScreenState{}
