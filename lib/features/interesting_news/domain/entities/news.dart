import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class News extends Equatable{
  final String title;
  final String desc;
  final String fullLink;

  News({@required this.title, @required this.desc,@required this.fullLink}): super([title, desc,fullLink]);

  String get getTitle {
    return this.title;
  }

  String get getDesc{
    return this.desc;
  }

  String get getFullLink {
    return this.fullLink;
  }
}