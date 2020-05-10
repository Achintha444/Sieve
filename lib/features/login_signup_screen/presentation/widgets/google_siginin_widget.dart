import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../bloc/login_signup_screen_bloc.dart';

class GoogleSigninWidget extends StatefulWidget {
  const GoogleSigninWidget({
    Key key,
  }) : super(key: key);

  @override
  _GoogleSigninWidgetState createState() => _GoogleSigninWidgetState();
}

class _GoogleSigninWidgetState extends State<GoogleSigninWidget> {
  GoogleSignInAccount _currentUser;
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'profile',
      'email',
    ],
  );

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen(
      (GoogleSignInAccount account) {
        setState(
          () {
            _currentUser = account;
          },
        );
      },
    );
    _googleSignIn.signInSilently();
  }

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
    await _handleSignIn();
    print(_currentUser);
    BlocProvider.of<LoginSignupScreenBloc>(context).dispatch(
      GetGoogleLoginEvent(account:_currentUser),
    );
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (e) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Google Login Falied! Try Again!'.toUpperCase(),
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
  }
}
