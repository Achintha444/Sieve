part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  DashboardState([List props = const <dynamic>[]]) : super(props);
}

class Initial extends DashboardState {}

class Loading extends DashboardState {}

class InternetError extends DashboardState{
  final LoginUser user;

  InternetError({@required this.user}): super([user]);
}

class Loaded extends DashboardState{
  final LoginUser user;
  final List<Dapp> dapp;

  Loaded({@required this.user,@required this.dapp}): super([user,dapp]);
}