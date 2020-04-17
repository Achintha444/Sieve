import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LoginUser extends Equatable{
  final String id;
  final String email;
  final String password;

  LoginUser({@required this.id,@required this.email, @required this.password}): super([email, password]);

  String get getId {
    return this.id;
  }
  
  String get getEmail {
    return this.email;
  }

  String get getPassword{
    return this.password;
  }
  
}