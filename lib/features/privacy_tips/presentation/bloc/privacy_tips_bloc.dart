import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sieve_data_privacy_app/features/privacy_tips/domain/entities/tips.dart';

import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/usecases/load_privacy_tips.dart';

part 'privacy_tips_event.dart';
part 'privacy_tips_state.dart';

class PrivacyTipsBloc extends Bloc<PrivacyTipsEvent, PrivacyTipsState> {

  final LoadPriavacyTips loadPriavacyTips;

  PrivacyTipsBloc({@required this.loadPriavacyTips});
  

  @override
  PrivacyTipsState get initialState => Initial();

  @override
  Stream<PrivacyTipsState> mapEventToState(
    PrivacyTipsEvent event,
  ) async* {
    if (event is LoadPrivacyTipsEvent) {
      yield Loading();
      final response = await this.loadPriavacyTips(event.user);
      yield response.fold(
        (faliure) => InternetError(user: event.user),
        (tips) => Loaded(user: event.user,tips:tips),
      );
    }
  }
}
