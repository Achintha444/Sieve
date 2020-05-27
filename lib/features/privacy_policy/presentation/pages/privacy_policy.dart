import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../categories/domain/entities/apps.dart';
import '../widgets/privacy_policy_widget.dart';

import '../../../../core/Constants/refresh_floating_button.dart';
import '../../../../injection_container.dart';
import '../../../bottom_nav/presentation/widgets/loading_widget.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../bloc/privacy_policy_bloc.dart';
import '../widgets/initial_state_widget.dart';
import '../widgets/internet_error_widget.dart';

class PrivacyPolicy extends StatelessWidget {
  final LoginUser user;
  final App app;

  const PrivacyPolicy({Key key, @required this.user, @required this.app})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PrivacyPolicyBloc>(
      builder: (context) => sl<PrivacyPolicyBloc>(),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: _BlocListner(user: user, appId: app.getID.toString()),
        ),
        floatingActionButton: RefreshFloatingButton(onTap: this._dispatchEvent),
      ),
    );
  }

  void _dispatchEvent(BuildContext context) {
    BlocProvider.of<PrivacyPolicyBloc>(context)
        .dispatch(LoadPrivacyPolicyEvent(user: user, appId: app.getID.toString()));
  }
}

class _BlocListner extends StatelessWidget {
  final LoginUser user;
  final String appId;

  const _BlocListner({Key key, @required this.user, @required this.appId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrivacyPolicyBloc, PrivacyPolicyState>(
      bloc: BlocProvider.of<PrivacyPolicyBloc>(context),
      builder: (context, state) {
        if (state is Initial) {
          return InitialStateWidget(user: user, appId: appId);
        } else if (state is Loading) {
          return LoadingWidget();
        } else if (state is InternetError) {
          return InternetErrorWidget(user: user, appId: appId);
        } else if (state is Loaded) {
          return PrivacyPolicyWidget(
            user: user,
            privacyPolicy: state.privacyPolicy,
            appId: appId,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
