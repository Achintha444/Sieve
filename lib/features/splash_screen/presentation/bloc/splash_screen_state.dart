part of 'splash_screen_bloc.dart';

@immutable
abstract class SplashScreenState extends Equatable {
  SplashScreenState([List props = const <dynamic>[]]) : super(props);
}

class Initial extends SplashScreenState {}

class Loading extends SplashScreenState {}

class Loaded extends SplashScreenState {}

class LoadedUser extends SplashScreenState {
  final LoginUser loginUser;

  LoadedUser({@required this.loginUser}): super([loginUser]);
}

class InternetError extends SplashScreenState {}

