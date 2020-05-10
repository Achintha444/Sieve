import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LoginUser extends Equatable{
  final String id;
  final String uid;
  final String email;
  final String password;
  final String imageUrl;

  LoginUser({@required this.id,@required this.email, @required this.password,@required this.uid,@required this.imageUrl}): super([email, password,uid,imageUrl]);

  String get getId {
    return this.id;
  }

  String get getUid{
    return this.uid;
  }
  
  String get getEmail {
    return this.email;
  }

  String get getPassword{
    return this.password;
  }

  String get getImageUrl{
    return this.imageUrl;
  }
  
}