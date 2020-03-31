import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../injection_container.dart';
import '../bloc/login_screen_bloc.dart';
import '../widgets/login_screen_widget.dart';
import '../../../../core/Constants/theme_data.dart' as td;

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(context),
    );
  }

  BlocProvider<LoginScreenBloc> _buildBody(BuildContext context) {
    return BlocProvider(
      builder: (context) => sl<LoginScreenBloc>(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: td.grdientData,
        child: Center(
          child: _BlocListener(),
        ),
      ),
    );
  }
}

class _BlocListener extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<LoginScreenBloc>(context),
      listener: (context, state) {
        if (state is Loading) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Connecting'.toUpperCase(),
                style: TextStyle(
                  fontSize: 17,
                  letterSpacing: 2,
                ),
                textAlign: TextAlign.center,
              ),
              duration: Duration(seconds: 4),
            ),
          );
        } else if (state is InternetError) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Internet Connection Failed'.toUpperCase(),
              ),
              duration: Duration(seconds: 10),
              action: SnackBarAction(
                label: 'Close',
                onPressed: () {
                  Scaffold.of(context).hideCurrentSnackBar();
                },
              ),
            ),
          );
        } else if (state is Loaded) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Loaded'.toUpperCase(),
              ),
              duration: Duration(seconds: 10),
              action: SnackBarAction(
                label: 'Close',
                onPressed: () {
                  Scaffold.of(context).hideCurrentSnackBar();
                },
              ),
            ),
          );
        }
      },
      child: LoginScreenWidget(),
    );
  }
}
