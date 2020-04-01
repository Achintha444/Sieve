import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_screen_bloc.dart';

class LoginScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 90, end: 60),
              duration: Duration(milliseconds: 900),
              builder: (BuildContext context, double size, Widget child) {
                return Text(
                  'LOGIN'.toUpperCase(),
                  style: TextStyle(
                      fontSize: size, letterSpacing: 13, color: Colors.white),
                );
              },
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 30,
                bottom: 30,
              ),
            ),
            //* TextFields
            //email
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20,
              ),
              child: TextField(
                autofocus: true,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1,
                ),
                decoration: _loginScreenInputDecoration('Email', Icons.email),
              ),
            ),
            //password
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20,
                top: 20,
                bottom: 50,
              ),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 1,
                ),
                decoration: _loginScreenInputDecoration('Password', Icons.lock),
              ),
            ),

            //* Login Button
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 45,
                    child: RaisedButton(
                      child: Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 2,
                        ),
                      ),
                      textColor: Colors.white,
                      elevation: 5,
                      color: Theme.of(context).accentColor,
                      onPressed: () {
                        _loginFunction(context);
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
            ),

            //* Dividers and Text
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                    right: 10,
                    left: 10,
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 10,
                    left: 10,
                  ),
                ),
                Text(
                  'Login With'.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 10,
                    left: 10,
                  ),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.white,
                    thickness: 1,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 10,
                    left: 10,
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
            ),

            //* Google and FB Login
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  heroTag: Key('google_loginscreen'),
                  child: Container(
                    height: 30,
                    key: Key('google_loginscreen'),
                    child: Image(
                      image: AssetImage('icons/google.png'),
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    _googleLoinFunction(context);
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 60,
                    right: 30,
                  ),
                ),
                FloatingActionButton(
                  heroTag: Key('fb_loginscreen'),
                  child: Container(
                    key: Key('fb_loginscreen'),
                    height: 50,
                    child: Image(
                      image: AssetImage('icons/facebook.png'),
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    _facebookLoginFunction(context);
                  },
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                bottom: 20,
              ),
            ),

            //* Signup Navigation
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'DO NOT HAVE AN ACCOUNT '.toUpperCase(),
                  style: TextStyle(
                    letterSpacing: 0.75,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  child: Text(
                    'SIGN UP'.toUpperCase(),
                    style: TextStyle(
                      letterSpacing: 0.75,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onTap: () {
                    _signupFunction();
                  },
                ),
                Text(
                  ' NOW!'.toUpperCase(),
                  style: TextStyle(
                    letterSpacing: 0.75,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _loginFunction(BuildContext context) {
    BlocProvider.of<LoginScreenBloc>(context).dispatch(
      GetFacebookLoginEvent(),
    );
  }

  InputDecoration _loginScreenInputDecoration(String labelText, IconData icon) {
    return InputDecoration(
      labelText: labelText,
      prefixIcon: Icon(
        icon,
        color: Colors.white,
      ),
      contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
      ),
      labelStyle: TextStyle(
        color: Colors.white,
        letterSpacing: 2,
      ),
    );
  }

  void _signupFunction() {
    print('tapped');
  }

  void _facebookLoginFunction(BuildContext context) {
    BlocProvider.of<LoginScreenBloc>(context).dispatch(
      GetFacebookLoginEvent(),
    );
  }

  void _googleLoinFunction(BuildContext context) {
    BlocProvider.of<LoginScreenBloc>(context).dispatch(
      GetGoogleLoginEvent(),
    );
  }
}
