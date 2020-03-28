import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/login_signup_screen_bloc.dart';
import '../widgets/login_signup_screen_widget.dart';

class LoginSignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
    );
  }

  BlocProvider<LoginSignupScreenBloc> _buildBody(BuildContext context) {
    return BlocProvider(
      builder: (context) => sl<LoginSignupScreenBloc>(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).accentColor,
              Theme.of(context).primaryColor,
            ],
          ),
        ),
        child: Center(
          child: BlocBuilder<LoginSignupScreenBloc, LoginSignupScreenState>(
            builder: (context, state) {
              if(state is Initial){
                return LoginSignupScreenWidget();
              }
            }
          ),
        ),
      ),
    );
  }
}