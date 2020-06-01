part of 'apps_bloc.dart';

abstract class AppsState extends Equatable {
  AppsState([List props = const <dynamic>[]]) : super(props);
}

class Initial extends AppsState {}

class Loading extends AppsState {}

class InternetError extends AppsState {
  final LoginUser user;
  final int categoryId;

  InternetError({@required this.user, @required this.categoryId})
      : super([user, categoryId]);
}

class Loaded extends AppsState {
  final LoginUser user;
  final int categoryId;
  final List<App> apps;

  Loaded({@required this.user, @required this.apps, @required this.categoryId})
      : super([user, apps, categoryId]);
}
