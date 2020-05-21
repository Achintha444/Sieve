import 'package:flutter/material.dart';

import '../../domain/entities/categories.dart';

class CategoriesModel extends Categories {
  final String title;
  final String desc;
  final String fullLink;

  CategoriesModel({@required this.title, @required this.desc,@required this.fullLink})
      : super(title:title,desc:desc, fullLink: fullLink);

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(title: json['news'], desc: (json['description']),fullLink: json['full_link']);
  }

  static List<CategoriesModel> fromJsonList(Map<String, dynamic> json){
    List<CategoriesModel> _news = new List<CategoriesModel>();
    int _len = json['news'].length;
    print(json);
    for (var i=0; i<_len; i++){
      _news.add(CategoriesModel.fromJson(json['news'][i]));
    }
    return _news;
  }

  Map<String, dynamic> toJson() {
    return {
      'title': super.getTitle,
      'desc': super.getDesc,
      'full_link': super.getFullLink,
    };
  }
}
