import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/entities/apps.dart';
import '../../domain/usecases/load_apps_search.dart';

part 'apps_search_event.dart';
part 'apps_search_state.dart';

class AppsSearchBloc extends Bloc<AppsSearchEvent, AppsSearchState> {
  final LoadAppsSearch loadAppsSearch;

  AppsSearchBloc({@required this.loadAppsSearch});

  @override
  AppsSearchState get initialState => Initial();

  @override
  Stream<AppsSearchState> mapEventToState(
    AppsSearchEvent event,
  ) async* {
    if (event is LoadAppsSearchEvent) {
      yield Loading();
      final response = await this.loadAppsSearch(event.user);
      print(response);
      yield response.fold(
        (faliure) => InternetError(user: event.user),
        (appsSearch) {
          print(appsSearch[0].getName);
          return Loaded(user: event.user, appsSearch: appsSearch);
        },
      );
    }
  }
}
