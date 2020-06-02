import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Constants/refresh_floating_button.dart';
import '../../../../core/Constants/search_floating_button.dart';
import '../../../../injection_container.dart';
import '../../../bottom_nav/presentation/widgets/loading_widget.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../bloc/dashboard_bloc.dart';
import '../widgets/dashboard_widget.dart';
import '../widgets/initial_state_widget.dart';
import '../widgets/internet_error_widget.dart';

class Dashboard extends StatelessWidget {
  final LoginUser user;

  const Dashboard({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardBloc>(
      builder: (context) => sl<DashboardBloc>(),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: _BlocListner(
            user: user,
          ),
        ),
        floatingActionButton: Container(
          height: 60,
          width: 130,
          child: Row(
            key: Key('Category Floating Buttons'),
            children: <Widget>[
              SearchFloatingButton(user: user,),
              Padding(
                padding: EdgeInsets.only(
                  left: 5,
                  right: 5,
                ),
              ),
              RefreshFloatingButton(onTap: this._dispatchEvent),
            ],
          ),
        ),
      ),
    );
  }

  void _dispatchEvent(BuildContext context) {
    BlocProvider.of<DashboardBloc>(context)
        .dispatch(LoadDashboardEvent(user: user));
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
    return BlocBuilder<DashboardBloc, DashboardState>(
      bloc: BlocProvider.of<DashboardBloc>(context),
      builder: (context, state) {
        if (state is Initial) {
          return InitialStateWidget(
            user: user,
          );
        } else if (state is Loading) {
          return LoadingWidget();
        } else if (state is InternetError) {
          return InternetErrorWidget(user: user);
        } else if (state is Loaded) {
          return DashboardWidget(
            user: user,
            dapp: state.dapp,
          );
        }
      },
    );
  }
}
