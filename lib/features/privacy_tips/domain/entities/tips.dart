import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Tips extends Equatable{
  final String title;
  final String desc;

  Tips({@required this.title, @required this.desc}): super([title, desc]);
  
  String get getTitle {
    return this.title;
  }

  String get getDesc{
    return this.desc;
  }
}