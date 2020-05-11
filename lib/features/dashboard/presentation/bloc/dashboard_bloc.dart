import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/entities/dapp.dart';
import '../../domain/usecases/load_dashboard.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {

  final LoadDashboard loadDashboard;

  DashboardBloc({@required this.loadDashboard});


  @override
  DashboardState get initialState => Initial();

  @override
  Stream<DashboardState> mapEventToState(
      DashboardEvent event,
      ) async* {
    if (event is LoadDashboardEvent) {
      yield Loading();
      final response = await this.loadDashboard(event.user);
      yield response.fold(
            (faliure) => InternetError(user: event.user),
            (dapp) => Loaded(user: event.user,dapp:dapp),
      );
    }
  }
}