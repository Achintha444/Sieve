import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/entities/categories.dart';
import '../../domain/usecases/load_categories.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {

  final LoadCategories loadCategories;

  CategoriesBloc({@required this.loadCategories});


  @override
  CategoriesState get initialState => Initial();

  @override
  Stream<CategoriesState> mapEventToState(
      CategoriesEvent event,
      ) async* {
    if (event is LoadCategoriesEvent) {
      yield Loading();
      final response = await this.loadCategories(event.user);
      yield response.fold(
            (faliure) => InternetError(user: event.user),
            (categories) => Loaded(user: event.user, categories: categories),
      );
    }
  }
}