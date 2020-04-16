import 'package:flutter/material.dart';

import '../../domain/entities/signup_user.dart';

class SignupUserModel extends SignupUser {
  final String email;
  final String password;

  SignupUserModel({@required this.email, @required this.password})
      : super(email: email, password: password);

  factory SignupUserModel.fromJson(Map<String, dynamic> json) {
    return SignupUserModel(email: json['email'], password: (json['password']));
  }

  Map<String, dynamic> toJson() {
    return {
      'email': super.getEmail,
      'password': super.getPassword,
    };
  }
}
