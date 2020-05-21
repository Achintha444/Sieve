import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sieve_data_privacy_app/core/Constants/refresh_floating_button.dart';

import '../../../../injection_container.dart';
import '../../../bottom_nav/presentation/widgets/loading_widget.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../bloc/categories_bloc.dart';
import '../widgets/initial_state_widget.dart';
import '../widgets/internet_error_widget.dart';
import '../widgets/categories_widget.dart';

class AppCategories extends StatelessWidget {
  final LoginUser user;

  const AppCategories({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoriesBloc>(
      builder: (context) => sl<CategoriesBloc>(),
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
    BlocProvider.of<CategoriesBloc>(context)
        .dispatch(LoadCategoriesEvent(user: user));
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
    return BlocBuilder<CategoriesBloc, CategoriesState>(
      bloc: BlocProvider.of<CategoriesBloc>(context),
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
          return CategoriesWidget(
            user: user,
            news: state.news,
          );
        } else{
          return Container();
        }
      },
    );
  }
}