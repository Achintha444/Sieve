import 'package:flutter/material.dart';

import '../../domain/entities/tips.dart';

class TipsModel extends Tips {
  final String title;
  final String desc;

  TipsModel({@required this.title, @required this.desc})
      : super(title:title,desc:desc);

  factory TipsModel.fromJson(Map<String, dynamic> json) {
    return TipsModel(title: json['tip'], desc: (json['description']));
  }

  static List<TipsModel> fromJsonList(Map<String, dynamic> json){
    List<TipsModel> _tips = new List<TipsModel>();
    int _len = json['tips'].length;
    for (var i=0; i<_len; i++){
      _tips.add(TipsModel.fromJson(json['tips'][i]));
    }
    return _tips;
  }

  Map<String, dynamic> toJson() {
    return {
      'title': super.getTitle,
      'desc': super.getDesc,
    };
  }
}
