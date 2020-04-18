import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/entities/laws.dart';
import '../../domain/usecases/load_privacy_laws.dart';

part 'privacy_laws_event.dart';
part 'privacy_laws_state.dart';

class PrivacyLawsBloc extends Bloc<PrivacyLawsEvent, PrivacyLawsState> {

  final LoadPrivacyLaws loadPrivacyLaws;

  PrivacyLawsBloc({@required this.loadPrivacyLaws});
  

  @override
  PrivacyLawsState get initialState => Initial();

  @override
  Stream<PrivacyLawsState> mapEventToState(
    PrivacyLawsEvent event,
  ) async* {
     if (event is LoadPrivacyLawsEvent) {
      yield Loading();
      final response = await this.loadPrivacyLaws(event.user);
      yield response.fold(
        (faliure) => InternetError(user: event.user),
        (laws) => Loaded(user: event.user,laws:laws),
      );
    }
  }
}
