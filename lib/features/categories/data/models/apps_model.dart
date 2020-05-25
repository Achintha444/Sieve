import 'package:flutter/material.dart';

import '../../domain/entities/apps.dart';

class AppsModel extends Apps {
  final int id;
  final String name;
  final String desc;
  final String icon;
  final String bg;

  AppsModel({@required this.id, @required this.name, @required this.desc, @required this.icon, @required this.bg})
      : super(id:id, name:name, desc:desc, icon:icon, bg:bg);

  factory AppsModel.fromJson(Map<String, dynamic> json) {
    return AppsModel(id: json['app_id'], name: (json['app_name']), desc: json['description'], icon: json['icon_image'], bg: json['background_image']);
  }

  static List<AppsModel> fromJsonList(Map<String, dynamic> json){
    List<AppsModel> _apps = new List<AppsModel>();
    int _len = json['apps'].length;
    for (var i=0; i<_len; i++){
      _apps.add(AppsModel.fromJson(json['apps'][i]));
    }
    return _apps;
  }

  Map<String, dynamic> toJson() {
    return {
      'apps_id': super.getID,
      'apps_name': super.getName,
      'description': super.getDesc,
      'icon_image': super.getIcon,
      'background_image': super.getBG,
    };
  }
}
