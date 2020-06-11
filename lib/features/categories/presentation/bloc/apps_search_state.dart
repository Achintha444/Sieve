part of 'apps_search_bloc.dart';

abstract class AppsSearchState extends Equatable {
  AppsSearchState([List props = const <dynamic>[]]) : super(props);
}

class Initial extends AppsSearchState {}

class Loading extends AppsSearchState {}

class InternetError extends AppsSearchState {
  final LoginUser user;

  InternetError({@required this.user}) : super([user]);
}

class Loaded extends AppsSearchState {
  final LoginUser user;
  final List<App> appsSearch;

  Loaded({@required this.user, @required this.appsSearch})
      : super([user, appsSearch]);
}
