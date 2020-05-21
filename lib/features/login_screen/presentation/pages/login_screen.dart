import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sieve_data_privacy_app/features/bottom_nav/presentation/pages/bottom_nav.dart';

import '../../../../injection_container.dart';
import '../bloc/login_screen_bloc.dart';
import '../widgets/login_screen_widget.dart';
import '../../../../core/Constants/theme_data.dart' as td;

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Theme.of(context).accentColor,
      // ),
      body: SingleChildScrollView(
        child: _buildBody(context),
      ),
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
              content: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    backgroundColor: Color.fromARGB(0, 0, 0, 0),
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 5,
                      right: 5,
                    ),
                  ),
                  Text(
                    'Connecting'.toUpperCase(),
                    style: TextStyle(
                      fontSize: 17,
                      letterSpacing: 2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
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
        } else if (state is InvalidInputError) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Theme.of(context).errorColor,
              content: Text(
                'Email or Password is Incorrect'.toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
              duration: Duration(seconds: 20),
              action: SnackBarAction(
                label: 'Close',
                onPressed: () {
                  Scaffold.of(context).hideCurrentSnackBar();
                },
                textColor: Colors.white,
              ),
            ),
          );
        } else if (state is ServerError) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Server Connection Error.\nTry Again!'.toUpperCase(),
              ),
              duration: Duration(seconds: 20),
              action: SnackBarAction(
                label: 'Close',
                onPressed: () {
                  Scaffold.of(context).hideCurrentSnackBar();
                },
              ),
            ),
          );
        } else if (state is Loaded) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => BottomNav(
                user: state.loginUser,
              ),
            ),
            (Route<dynamic> route) => false,
          );
        }
      },
      child: LoginScreenWidget(),
    );
  }
}
