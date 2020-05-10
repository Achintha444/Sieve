import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../domain/entities/user.dart';

class UserModel extends User{
  final String uid;
  final String email;
  final String imageUrl;

  UserModel({@required this.uid,@required this.email, @required this.imageUrl})
      : super(uid: uid,email: email, imageUrl: imageUrl);

  factory UserModel.fromJsonGoogle(GoogleSignInAccount account) {
    return UserModel(uid:account.id ,email: account.email, imageUrl: account.photoUrl);
  }

  factory UserModel.fromJsonFacebook(Map<String, dynamic> json) {
    return UserModel(uid:json['id'] ,email: json['email'], imageUrl: json['password']);
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': super.getUid,
      'email': super.getEmail,
      'imageUrl': super.getImageUrl,
    };
  }
}