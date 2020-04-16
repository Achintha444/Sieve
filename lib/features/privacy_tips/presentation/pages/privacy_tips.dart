import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../bottom_nav/presentation/widgets/loading_widget.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../bloc/privacy_tips_bloc.dart';
import '../widgets/initial_state_widget.dart';
import '../widgets/internet_error_widget.dart';
import '../widgets/privacy_tips_widget.dart';

class PrivacyTips extends StatelessWidget {

  final LoginUser user;

  const PrivacyTips({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PrivacyTipsBloc>(
      builder: (context) => sl<PrivacyTipsBloc>(),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: _BlocListner(user: user,),
        ),
      ),
    );
  }
}

class _BlocListner extends StatelessWidget {

  final LoginUser user;

  const _BlocListner({
    Key key,
    @required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrivacyTipsBloc, PrivacyTipsState>(
      bloc: BlocProvider.of<PrivacyTipsBloc>(context),
      builder: (context, state) {
        if (state is Initial) {
          return InitialStateWidget(user: user,);
        } else if (state is Loading) {
          return LoadingWidget();
        } else if (state is InternetError) {
          return InternetErrorWidget(user: user);
        } else if (state is Loaded) {
          return PrivacyTipsWidget(user: user,tips: state.tips,);
        } 
      },
    );
  }
}
