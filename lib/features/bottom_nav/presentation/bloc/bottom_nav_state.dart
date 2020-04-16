part of 'bottom_nav_bloc.dart';

abstract class BottomNavState extends Equatable {
  BottomNavState([List props = const <dynamic>[]]) : super(props);
}

class Initial extends BottomNavState{}

class Loading extends BottomNavState{}

class NewsFeedState extends BottomNavState{
  final LoginUser user;

  NewsFeedState({@required this.user}): super([user]);
}

class CategoryState extends BottomNavState{
  final LoginUser user;

  CategoryState({@required this.user}): super([user]);
}

class DashboardState extends BottomNavState{
  final LoginUser user;

  DashboardState({@required this.user}): super([user]);
}

class PrivacyTipsState extends BottomNavState{
  final LoginUser user;

  PrivacyTipsState({@required this.user}): super([user]);
}

class PrivacyLawsState extends BottomNavState{
  final LoginUser user;

  PrivacyLawsState({@required this.user}): super([user]);
}

class InternetError extends BottomNavState{
  final BottomNavEvent event;

  InternetError({@required this.event}): super([event]);
}