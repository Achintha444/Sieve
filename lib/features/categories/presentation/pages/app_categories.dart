import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/Constants/refresh_floating_button.dart';
import '../../../../injection_container.dart';
import '../../../bottom_nav/presentation/widgets/loading_widget.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../bloc/apps_bloc.dart' as app_bloc;
import '../bloc/categories_bloc.dart' as cat_bloc;
import '../widgets/categories_widget.dart';
import '../widgets/initial_state_widget.dart';
import '../widgets/internet_error_widget.dart';

class AppCategories extends StatelessWidget {
  final LoginUser user;

  const AppCategories({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<cat_bloc.CategoriesBloc>(
          builder: (context) => sl<cat_bloc.CategoriesBloc>(),
        ),
        BlocProvider<app_bloc.AppsBloc>(
          builder: (context) => sl<app_bloc.AppsBloc>(),
        ),
      ],
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
    BlocProvider.of<cat_bloc.CategoriesBloc>(context)
        .dispatch(cat_bloc.LoadCategoriesEvent(user: user));
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
    return BlocBuilder<cat_bloc.CategoriesBloc, cat_bloc.CategoriesState>(
      bloc: BlocProvider.of<cat_bloc.CategoriesBloc>(context),
      builder: (context, state) {
        if (state is cat_bloc.Initial) {
          return InitialStateWidget(
            user: user,
          );
        } else if (state is cat_bloc.Loading) {
          return LoadingWidget();
        } else if (state is cat_bloc.InternetError) {
          return InternetErrorWidget(user: user);
        } else if (state is cat_bloc.Loaded) {
          return CategoriesWidget(
            user: user,
            categories: state.categories,
          );
        } else {
          return Container();
        }
      },
    );
  }
}
