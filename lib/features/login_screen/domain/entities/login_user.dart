import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LoginUser extends Equatable{
  final String email;
  final String password;

  LoginUser({@required this.email, @required this.password}): super([email, password]);

  String get getEmail {
    return this.email;
  }

  String get getPassword{
    return this.password;
  }
  
}