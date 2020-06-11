part of 'categories_bloc.dart';

abstract class CategoriesState extends Equatable {
  CategoriesState([List props = const <dynamic>[]]) : super(props);
}

class Initial extends CategoriesState {}

class Loading extends CategoriesState {}

class InternetError extends CategoriesState{
  final LoginUser user;

  InternetError({@required this.user}): super([user]);
}

class Loaded extends CategoriesState{
  final LoginUser user;
  final List<Categories> categories;

  Loaded({@required this.user,@required this.categories}): super([user,categories]);
}