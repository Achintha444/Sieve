part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  DashboardEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadDashboardEvent extends DashboardEvent {
  final LoginUser user;

  LoadDashboardEvent({@required this.user}): super([user]);
}