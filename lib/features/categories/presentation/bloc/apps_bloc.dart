import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/entities/apps.dart';
import '../../domain/usecases/load_apps.dart';

part 'apps_event.dart';
part 'apps_state.dart';

class AppsBloc extends Bloc<AppsEvent, AppsState> {

  final LoadApps loadApps;

  AppsBloc({@required this.loadApps});


  @override
  AppsState get initialState => Initial();

  @override
  Stream<AppsState> mapEventToState(
      AppsEvent event,
      ) async* {
    if (event is LoadAppsEvent) {
      yield Loading();
      final response = await this.loadApps([event.user, event.categoryId]);
      yield response.fold(
            (faliure) => InternetError(user: event.user),
            (apps) => Loaded(user: event.user, apps: apps),
      );
    }
  }
}