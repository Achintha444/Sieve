part of 'apps_bloc.dart';

abstract class AppsEvent extends Equatable {
  AppsEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadAppsEvent extends AppsEvent {
  final LoginUser user;
  final int categoryId;

  LoadAppsEvent({@required this.user, @required this.categoryId}): super([user]);
}