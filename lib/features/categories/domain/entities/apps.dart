import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Apps extends Equatable{
  final int id;
  final String name;
  final String desc;
  final String icon;
  final String bg;

  Apps({@required this.id, @required this.name, @required this.desc, @required this.icon, @required this.bg}): super([id, name, desc, icon, bg]);

  int get getID {
    return this.id;
  }

  String get getName{
    return this.name;
  }

  String get getDesc {
    return this.desc;
  }

  String get getIcon {
    return this.icon;
  }

  String get getBG {
    return this.bg;
  }
}