part of 'login_screen_bloc.dart';

abstract class LoginScreenEvent extends Equatable {
  LoginScreenEvent([List props = const <dynamic>[]]) : super(props);
}

class GetLoginEvent extends LoginScreenEvent {
  final String email;
  final String password;

  GetLoginEvent({@required this.email, @required this.password})
      : super([email, password]);
}

class GetFacebookLoginEvent extends LoginScreenEvent {}

class GetGoogleLoginEvent extends LoginScreenEvent {}
