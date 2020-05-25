import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Categories extends Equatable{
  final int id;
  final String name;
  final String icon;

  Categories({@required this.id, @required this.name, @required this.icon}): super([id, name, icon]);

  int get getID {
    return this.id;
  }

  String get getName{
    return this.name;
  }

  String get getIcon {
    return this.icon;
  }
}