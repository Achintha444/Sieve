part of 'categories_bloc.dart';

abstract class CategoriesEvent extends Equatable {
  CategoriesEvent([List props = const <dynamic>[]]) : super(props);
}

class LoadCategoriesEvent extends CategoriesEvent {
  final LoginUser user;

  LoadCategoriesEvent({@required this.user}): super([user]);
}