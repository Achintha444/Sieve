import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../../../bottom_nav/presentation/widgets/loading_widget.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../bloc/apps_bloc.dart';
import 'app_card.dart';
import 'apps_initial_state_widget.dart';
import 'apps_internet_error_widget.dart';

class AppsWidget extends StatelessWidget {
  final LoginUser user;
  final int categoryId;

  const AppsWidget({Key key, @required this.user, @required this.categoryId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppsBloc>(
      builder: (context) => sl<AppsBloc>(),
      child: _BlocListner(
        user: user,
        categoryId: categoryId
      ),
    );
  }

//  void _dispatchEvent(BuildContext context) {
//    BlocProvider.of<AppsBloc>(context)
//        .dispatch(LoadAppsEvent(user: widget.user, categoryId: categoryId));
//  }
}

class _BlocListner extends StatelessWidget {
  final LoginUser user;
  final int categoryId;

  const _BlocListner({
    Key key,
    @required this.user,
    @required this.categoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppsBloc, AppsState>(
      bloc: BlocProvider.of<AppsBloc>(context),
      builder: (context, state) {
        if (state is Initial) {
          return AppsInitialStateWidget(
            user: user,
            categoryId: categoryId
          );
        } else if (state is Loading) {
          return LoadingWidget();
        } else if (state is InternetError) {
          return AppsInternetErrorWidget(user: user, categoryId: categoryId);
        }  else if (state is Loaded) {
          return Column(
            children: List.generate(
              state.apps.length,
                  (index) {
                print (categoryId);
                return AppCard(
                  user: user,
                  id: state.apps[index].getID,
                  name: state.apps[index].getName,
                  desc: state.apps[index].getDesc,
                  icon: state.apps[index].getIcon,
                  bg: state.apps[index].getBG,
                );
              },
            ),
          );
        } else{
          return Container();
        }
      },
    );
  }
}