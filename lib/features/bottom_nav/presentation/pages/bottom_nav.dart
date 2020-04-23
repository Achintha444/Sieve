import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sieve_data_privacy_app/features/interesting_news/presentation/pages/interesting_news.dart';

import '../../../../injection_container.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../../../privacy_laws/presentation/pages/privacy_laws.dart';
import '../../../privacy_tips/presentation/pages/privacy_tips.dart';
import '../bloc/bottom_nav_bloc.dart';
import '../widgets/bottom_nav_widget.dart';
import '../widgets/initial_state_widget.dart';
import '../widgets/internet_error_widget.dart';
import '../widgets/loading_widget.dart';
import '../widgets/temp.dart';

class BottomNav extends StatelessWidget {

  final LoginUser user;

  const BottomNav({Key key, @required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BottomNavBloc>(
      builder: (context) => sl<BottomNavBloc>(),
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: _BlocListner(user: user,),
        ),
        bottomNavigationBar: BottomNavWidget(user: user,),
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
    return BlocBuilder<BottomNavBloc, BottomNavState>(
      bloc: BlocProvider.of<BottomNavBloc>(context),
      builder: (context, state) {
        if (state is Initial) {
          return InitialStateWidget(user: user,);
        } else if (state is Loading) {
          return LoadingWidget();
        } else if (state is InternetError) {
          return InternetErrorWidget(user: user,event: state.event,);
        } else if (state is NewsFeedState) {
          return InterestingNews(user: user,);
        } else if (state is CategoryState) {
          return Temp(user: user,);
        } else if (state is DashboardState) {
          return Temp(user: user,);
        } else if (state is PrivacyTipsState) {
          return PrivacyTips(user: user,);
        } else if (state is PrivacyLawsState) {
          return PrivacyLaws(user: user,);
        } else{
          return Container();
        }
      },
    );
  }
}
