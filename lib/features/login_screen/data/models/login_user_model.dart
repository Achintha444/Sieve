import 'package:flutter/material.dart';

import '../../domain/entities/login_user.dart';

class LoginUserModel extends LoginUser {
  final String id;
  final String uid;
  final String email;
  final String password;
  final String imageUrl;

  LoginUserModel({@required this.id,@required this.email, @required this.password,@required this.uid,@required this.imageUrl})
      : super(id: id,email: email, password: password,uid:uid,imageUrl:imageUrl);

  factory LoginUserModel.fromJson(Map<String, dynamic> json) {
    return LoginUserModel(id:json['id'] ,email: json['email'], password: json['password'],uid: null,imageUrl: null);
  }

  factory LoginUserModel.fromJsonGF(Map<String, dynamic> json) {
    return LoginUserModel(id:json['id'] ,email: json['email'], uid: json['uid'],imageUrl: json['imageUrl'],password: null);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': super.getId,
      'email': super.getEmail,
      'password': super.getPassword,
    };
  }
}
