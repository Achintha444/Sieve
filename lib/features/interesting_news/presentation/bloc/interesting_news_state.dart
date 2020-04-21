part of 'interesting_news_bloc.dart';

abstract class InterestingNewsState extends Equatable {
  InterestingNewsState([List props = const <dynamic>[]]) : super(props);
}

class Initial extends InterestingNewsState {}

class Loading extends InterestingNewsState {}

class InternetError extends InterestingNewsState{
  final LoginUser user;

  InternetError({@required this.user}): super([user]);
}

class Loaded extends InterestingNewsState{
  final LoginUser user;
  final List<News> news;

  Loaded({@required this.user,@required this.news}): super([user,news]);
}