import 'package:flutter/material.dart';

import '../../domain/entities/dapp.dart';

class DappModel extends Dapp {
  final String appName;
  final String iconImage;
  final String categoryName;
  final int dCount;

  DappModel({@required this.appName, @required this.iconImage, @required this.categoryName,@required this.dCount})
      : super(appName:appName, iconImage:iconImage, categoryName:categoryName, dCount:dCount);

  factory DappModel.fromJson(Map<String, dynamic> json) {
    return DappModel(appName: json['app_name'], iconImage: json['icon_image'], categoryName: (json['category_name']),dCount:(json['d_count']));
  }

  static List<DappModel> fromJsonList(Map<String, dynamic> json){
    List<DappModel> _dapp = new List<DappModel>();
    int _len = json['dapp'].length;
    for (var i=0; i<_len; i++){
      _dapp.add(DappModel.fromJson(json['dapp'][i]));
    }
    return _dapp;
  }

  Map<String, dynamic> toJson() {
    return {
      'appName': super.getAppName,
      'iconImage': super.getIconImage,
      'categoryName': super.getAppName,
      'dCount': super.getDCount
    };
  }
}