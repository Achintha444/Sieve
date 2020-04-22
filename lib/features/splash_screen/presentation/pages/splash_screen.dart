import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sieve_data_privacy_app/features/bottom_nav/presentation/pages/bottom_nav.dart';

import '../../../../injection_container.dart';
import '../../../login_signup_screen/presentation/pages/login_signup_screen.dart';
import '../bloc/splash_screen_bloc.dart';
import '../widgets/internet_error_widget.dart';
import '../widgets/splash_screen_widget.dart';
import '../../../../core/Constants/theme_data.dart' as td;

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  BlocProvider<SplashScreenBloc> _buildBody(BuildContext context) {
    return BlocProvider(
      builder: (context) => sl<SplashScreenBloc>(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: td.grdientData,
        child: Center(
          child: BlocBuilder<SplashScreenBloc, SplashScreenState>(
            builder: (context, state) {
              if ((state is Initial) || (state is Loading)) {
                return SplashScreenWidget();
              } else if (state is InternetError) {
                return InternetErrorWidget();
              } else if (state is Loaded) {
                return LoginSignupScreen();
              } else if (state is LoadedUser) {
                return BottomNav(user: state.loginUser);
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
