import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/util/input_converter.dart';
import '../bloc/login_screen_bloc.dart';
import 'facebook_signup_screen_widget.dart';
import 'google_siginin_widget.dart';

class LoginScreenWidget extends StatefulWidget {
  @override
  _LoginScreenWidgetState createState() => _LoginScreenWidgetState();
}

class _LoginScreenWidgetState extends State<LoginScreenWidget> {
  final InputConverter _inputConverter = new InputConverter();
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  
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
              key: Key('login'),
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
            //* TextFormFields
            //email
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1,
                        fontSize: 20,
                      ),
                      validator: (value) {
                        return _emailValidator(value);
                      },
                      onChanged: (value) {
                        this._email = value;
                      },
                      decoration:
                          _loginScreenInputDecoration('Email', Icons.email),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20,
                      top: 20,
                      bottom: 50,
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 1,
                        fontSize: 20,
                      ),
                      validator: (value) {
                        return _passwordValidator(value);
                      },
                      onChanged: (value) {
                        this._password = value;
                      },
                      decoration:
                          _loginScreenInputDecoration('Password', Icons.lock),
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
                          key: Key('login_button'),
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
                
                ],
              ),
            ),
            //password

            //* Login Button

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
                    _signupFunction(context);
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

  String _passwordValidator(String password) {
    if (password.isEmpty) {
      return 'Password Cannot be Empty!';
    } else {
      if (!(_inputConverter.checkPassword(password))) {
        return 'Invalid Password!';
      }
      return null;
    }
  }

  String _emailValidator(String email) {
    if (email.isEmpty) {
      return 'Email Cannot be Empty!';
    } else {
      if (!(_inputConverter.checkEmail(email))) {
        return 'Invalid Email!';
      }
      return null;
    }
  }

  void _loginFunction(BuildContext context) {
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a Snackbar.
      BlocProvider.of<LoginScreenBloc>(context).dispatch(
        GetLoginEvent(
          email: _email,
          password: _password,
        ),
      );
    }
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
        fontSize: 13,
      ),
      // errorBorder: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(4.0),
      // ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Theme.of(context).errorColor,
        ),
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }

  void _signupFunction(BuildContext context) {
    Navigator.pushNamed(context, '/signupScreen');
  }

}
