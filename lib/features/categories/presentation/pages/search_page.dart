import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sieve_data_privacy_app/features/categories/presentation/widgets/search_widget.dart';

import '../../../../core/Constants/refresh_floating_button.dart';
import '../../../../injection_container.dart';
import '../../../bottom_nav/presentation/widgets/loading_widget.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../bloc/apps_search_bloc.dart';
import '../widgets/search_initial_state_widget.dart';
import '../widgets/search_internet_error_widget.dart';

class SearchPage extends StatelessWidget {
  final LoginUser user;

  const SearchPage({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppsSearchBloc>(
      builder: (context) => sl<AppsSearchBloc>(),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: _BlocListner(
            user: user,
          ),
        ),
        floatingActionButton: RefreshFloatingButton(onTap: this._dispatchEvent),
      ),
    );
  }

  void _dispatchEvent(BuildContext context) {
    print('assaas');
    BlocProvider.of<AppsSearchBloc>(context)
        .dispatch(LoadAppsSearchEvent(user: user));
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
    return BlocBuilder<AppsSearchBloc, AppsSearchState>(
      bloc: BlocProvider.of<AppsSearchBloc>(context),
      builder: (context, state) {
        if (state is Initial) {
          return SearchInitialStateWidget(
            user: user,
          );
        } else if (state is Loading) {
          return LoadingWidget();
        } else if (state is InternetError) {
          return SearchInternetErrorWidget(user: user);
        } else if (state is Loaded) {
          return SearchWidget(
            user: user,
            apps: state.appsSearch,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
