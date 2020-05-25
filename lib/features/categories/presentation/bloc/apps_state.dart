part of 'apps_bloc.dart';

abstract class AppsState extends Equatable {
  AppsState([List props = const <dynamic>[]]) : super(props);
}

class Initial extends AppsState {}

class Loading extends AppsState {}

class InternetError extends AppsState{
  final LoginUser user;

  InternetError({@required this.user}): super([user]);
}

class Loaded extends AppsState{
  final LoginUser user;
  final List<Apps> apps;

  Loaded({@required this.user,@required this.apps}): super([user,apps]);
}