import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_signup_screen_bloc.dart';

class FacebookSigninWidget extends StatelessWidget {
  const FacebookSigninWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: 'facebook',
      child: Container(
        key: Key('fb_login'),
        height: 50,
        child: Image(
          image: AssetImage('icons/facebook.png'),
          color: Colors.white,
        ),
      ),
      onPressed: () {
        _facebookLoginFunction(context);
      },
    );
  }

  void _facebookLoginFunction(BuildContext context) {
    BlocProvider.of<LoginSignupScreenBloc>(context).dispatch(
      GetFacebookLoginEvent(),
    );
  }
}
