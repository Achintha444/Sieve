import 'package:flutter/material.dart';

import '../../domain/entities/apps.dart';

class AppsModel extends App {
  final int id;
  final String name;
  final String desc;
  final String icon;
  final String bg;
  final String link;

  AppsModel({@required this.id, @required this.name, @required this.desc, @required this.icon, @required this.bg, @required this.link})
      : super(id:id, name:name, desc:desc, icon:icon, bg:bg, link: link);

  factory AppsModel.fromJson(Map<String, dynamic> json) {
    return AppsModel(id: json['app_id'], name: (json['app_name']), desc: json['description'], icon: json['icon_image'], bg: json['background_image'], link: json['privacy_policy_link']);
  }

  static List<AppsModel> fromJsonList(Map<String, dynamic> json){
    List<AppsModel> _apps = new List<AppsModel>();
    int _len = json['apps'].length;
    if (_len > 0) {
      for (var i=0; i<_len; i++){
        _apps.add(AppsModel.fromJson(json['apps'][i]));
      }
    }
    else {
      _apps.add(AppsModel.fromJson({"app_id": 0, "category_id": 0, "description": "", "icon_image": "", "background_image": "", "app_name": "", "privacy_policy_link": ""}));
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
      'privacy_policy_link': super.getLink
    };
  }
}
