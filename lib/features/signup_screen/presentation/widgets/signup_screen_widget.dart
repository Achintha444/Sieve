import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/signup_screen_bloc.dart';
import '../../../../core/util/input_converter.dart';

class SignupScreenWidget extends StatefulWidget {
  @override
  _SignupScreenWidgetState createState() => _SignupScreenWidgetState();
}

class _SignupScreenWidgetState extends State<SignupScreenWidget> {
  final InputConverter _inputConverter = new InputConverter();
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  String _rePassword;

  
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
              tween: Tween<double>(begin: 80, end: 60),
              key: Key('Sign up'),
              duration: Duration(milliseconds: 900),
              builder: (BuildContext context, double size, Widget child) {
                return Text(
                  'Signup'.toUpperCase(),
                  style: TextStyle(
                      fontSize: size, letterSpacing: 10, color: Colors.white),
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
            
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  //email
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
                          _signupScreenInputDecoration('Email', Icons.email),
                    ),
                  ),
                  //password
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20,
                      top: 20,
                      bottom: 20,
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
                          _signupScreenInputDecoration('Password', Icons.lock),
                    ),
                  ),
                  //rePassword
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20,
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
                        this._rePassword = value;
                      },
                      decoration:
                          _signupScreenInputDecoration('Re Enter Password', Icons.lock),
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
                          key: Key('Signup_button'),
                          height: 45,
                          child: RaisedButton(
                            child: Text(
                              'SIGNUP',
                              style: TextStyle(
                                fontSize: 20,
                                letterSpacing: 2,
                              ),
                            ),
                            textColor: Colors.white,
                            elevation: 5,
                            color: Theme.of(context).accentColor,
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
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                top: 30,
                bottom: 30,
              ),
            ),

            //* Login Navigation
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Already HAVE AN ACCOUNT '.toUpperCase(),
                  style: TextStyle(
                    letterSpacing: 0.75,
                    color: Colors.white,
                  ),
                ),
                GestureDetector(
                  child: Text(
                    'LOGIN'.toUpperCase(),
                    style: TextStyle(
                      letterSpacing: 0.75,
                      color: Theme.of(context).accentColor,
                    ),
                  ),
                  onTap: () {
                    _loginFunction(context);
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
      } else{
        if (this._password != this._rePassword){
           return 'Passwords do not Match!';
        }
        return null;
      }
      
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

  void _signupFunction(BuildContext context) {
    if (_formKey.currentState.validate()) {
      // If the form is valid, display a Snackbar.
      BlocProvider.of<SignupScreenBloc>(context).dispatch(
        GetSignupEvent(
          email: _email,
          password: _password,
        ),
      );
    }
  }

  InputDecoration _signupScreenInputDecoration(String labelText, IconData icon) {
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

  void _loginFunction(BuildContext context) {
    Navigator.pushNamed(context, '/loginScreen');
  }

}
