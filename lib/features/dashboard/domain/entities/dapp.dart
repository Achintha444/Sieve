import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Dapp extends Equatable {
  final String appName;
  final String iconImage;
  final String categoryName;
  final int dCount;

  Dapp({@required this.appName, @required this.iconImage, @required this.categoryName,@required this.dCount})
      : super([appName, iconImage, categoryName,dCount]);

  String get getAppName {
    return this.appName;
  }

  String get getIconImage {
    return this.iconImage;
  }

  String get getCategoryName {
    return this.categoryName;
  }

  int get getDCount {
    return this.dCount;
  }
}
