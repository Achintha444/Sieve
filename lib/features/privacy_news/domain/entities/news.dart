import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class News extends Equatable {
  final String law;
  final String fullLink;
  final String desc;

  News({@required this.law, @required this.fullLink, @required this.desc})
      : super([law, fullLink, desc]);

  String get getLaw {
    return this.law;
  }

  String get getFullLink {
    return this.fullLink;
  }

  String get getDesc {
    return this.desc;
  }
}
