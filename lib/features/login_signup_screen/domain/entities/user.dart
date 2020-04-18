import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class User extends Equatable{
  final String uid;
  final String email;
  final String imageUrl;

  User({@required this.uid,@required this.email, @required this.imageUrl}): super([uid,email, imageUrl]);

 String get getUid {
    return this.uid;
  }

  String get getEmail {
    return this.email;
  }

  String get getImageUrl{
    return this.imageUrl;
  }
  
}