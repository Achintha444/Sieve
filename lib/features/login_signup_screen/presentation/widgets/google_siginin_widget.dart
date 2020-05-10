import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_signup_screen_bloc.dart';

class GoogleSigninWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'google',
      child: Container(
        height: 30,
        key: Key('google_login'),
        child: Image(
          image: AssetImage('icons/google.png'),
          color: Colors.white,
        ),
      ),
      onPressed: () async{
        await _googleLoinFunction(context);
      },
    );
  }

  Future<void> _googleLoinFunction(BuildContext context) async{
    BlocProvider.of<LoginSignupScreenBloc>(context).dispatch(
      GetGoogleLoginEvent(),
    );
  }
}
