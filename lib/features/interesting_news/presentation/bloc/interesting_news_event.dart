part of 'interesting_news_bloc.dart';

abstract class InterestingNewsEvent extends Equatable {
  InterestingNewsEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadInterestingNewsEvent extends InterestingNewsEvent {
  final LoginUser user;

  LoadInterestingNewsEvent({@required this.user}): super([user]);
}