import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_screen_bloc.dart';

class GoogleSigninWidget extends StatelessWidget {
  @override

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
      onPressed: () {
        _googleLoinFunction(context);
      },
    );
  }

  void _googleLoinFunction(BuildContext context) async{
    BlocProvider.of<LoginScreenBloc>(context).dispatch(
      GetGoogleLoginEvent(),
    );
  }
}
