import 'package:flutter/material.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

class LoginUserModel extends LoginUser {
  final String email;
  final String password;

  LoginUserModel({@required this.email, @required this.password})
      : super(email: email, password: password);

  factory LoginUserModel.fromJson(Map<String, dynamic> json) {
    return LoginUserModel(email: json['email'], password: (json['password']));
  }

  Map<String, dynamic> toJson() {
    return {
      'email': super.getEmail,
      'password': super.getPassword,
    };
  }
}
