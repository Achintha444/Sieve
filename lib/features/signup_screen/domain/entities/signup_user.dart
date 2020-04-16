import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SignupUser extends Equatable{
  final String email;
  final String password;

  SignupUser({@required this.email, @required this.password}): super([email, password]);

  String get getEmail {
    return this.email;
  }

  String get getPassword{
    return this.password;
  }
  
}