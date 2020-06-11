part of 'apps_search_bloc.dart';

abstract class AppsSearchEvent extends Equatable {
  AppsSearchEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadAppsSearchEvent extends AppsSearchEvent {
  final LoginUser user;

  LoadAppsSearchEvent({@required this.user}): super([user]);
}