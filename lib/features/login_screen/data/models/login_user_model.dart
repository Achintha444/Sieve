import 'package:flutter/material.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

class LoginUserModel extends LoginUser {
  final String id;
  final String email;
  final String password;

  LoginUserModel({@required this.id,@required this.email, @required this.password})
      : super(id: id,email: email, password: password);

  factory LoginUserModel.fromJson(Map<String, dynamic> json) {
    return LoginUserModel(id:json['id'] ,email: json['email'], password: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': super.getId,
      'email': super.getEmail,
      'password': super.getPassword,
    };
  }
}
