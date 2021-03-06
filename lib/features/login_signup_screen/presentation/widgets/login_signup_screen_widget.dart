import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'google_siginin_widget.dart';
import 'facebook_signup_screen_widget.dart';

class LoginSignupScreenWidget extends StatelessWidget {
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
              tween: Tween<double>(begin: 200, end: 130),
              duration: Duration(milliseconds: 900),
              builder: (BuildContext context, double size, Widget child) {
                return Image(
                  key: Key('logo_image'),
                  image: AssetImage('icons/logo.png'),
                  height: size,
                );
              },
            ),
            
            //* Login button
            Padding(
              padding: EdgeInsets.only(
                top: 40,
                bottom: 40,
              ),
            ),
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
                      textColor: Theme.of(context).accentColor,
                      elevation: 5,
                      color: Colors.white,
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
                top: 10,
                bottom: 10,
              ),
            ),
            
            // * Signup button
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
                        'SIGNUP',
                        style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 2,
                        ),
                      ),
                      textColor: Theme.of(context).accentColor,
                      color: Colors.white,
                      elevation: 5,
                      shape: Theme.of(context).buttonTheme.shape,
                      onPressed: () {
                        _signupFunction(context);
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
                GoogleSigninWidget(),
                Padding(
                  padding: EdgeInsets.only(
                    left: 60,
                    right: 30,
                  ),
                ),
                FacebookSigninWidget(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _signupFunction(BuildContext context) {
    Navigator.pushNamed(context, '/signupScreen');
  }

//CupertinoPageRoute

  void _loginFunction(BuildContext context) {
    Navigator.pushNamed(context, '/loginScreen');
  }




}



