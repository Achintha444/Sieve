part of 'splash_screen_bloc.dart';

@immutable
abstract class SplashScreenEvent extends Equatable {
  SplashScreenEvent([List props = const <dynamic>[]]) : super(props);
}

class NavigateToLoginScreenEvent extends SplashScreenEvent {}