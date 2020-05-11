part of 'bottom_nav_bloc.dart';

abstract class BottomNavEvent extends Equatable {
  BottomNavEvent([List props = const <dynamic>[]]) : super(props);
}

class NewsFeedEvent extends BottomNavEvent {
  final LoginUser user;

  NewsFeedEvent({@required this.user}): super([user]);
}

class CategoryEvent extends BottomNavEvent {
  final LoginUser user;

  CategoryEvent({@required this.user}): super([user]);
}

class DashboardEvent extends BottomNavEvent {
  final LoginUser user;

  DashboardEvent({@required this.user}): super([user]);
}

class TipsEvent extends BottomNavEvent {
  final LoginUser user;

  TipsEvent({@required this.user}): super([user]);
}

class LawsEvent extends BottomNavEvent {
  final LoginUser user;

  LawsEvent({@required this.user}): super([user]);
}