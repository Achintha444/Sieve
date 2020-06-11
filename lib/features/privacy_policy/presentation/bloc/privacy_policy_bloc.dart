import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/domain/usecases/get_privacy_policy.dart';

import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/entities/privacy_policy.dart';

part 'privacy_policy_event.dart';
part 'privacy_policy_state.dart';

class PrivacyPolicyBloc extends Bloc<PrivacyPolicyEvent, PrivacyPolicyState> {
  final GetPriacyPolicy getPriacyPolicy;

  PrivacyPolicyBloc({@required this.getPriacyPolicy});

  @override
  PrivacyPolicyState get initialState => Initial();

  @override
  Stream<PrivacyPolicyState> mapEventToState(
    PrivacyPolicyEvent event,
  ) async* {
    if (event is LoadPrivacyPolicyEvent) {
      yield Loading();
      final response = await this.getPriacyPolicy([event.appId,event.user]);
      yield response.fold(
        (faliure) => InternetError(user: event.user),
        (policy) => Loaded(user: event.user, privacyPolicy: policy),
      );
    }
  }
}
