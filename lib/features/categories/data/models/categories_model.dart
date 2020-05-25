import 'package:flutter/material.dart';

import '../../domain/entities/categories.dart';

class CategoriesModel extends Categories {
  final int id;
  final String name;
  final String icon;

  CategoriesModel({@required this.id, @required this.name, @required this.icon})
      : super(id:id, name:name, icon:icon);

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(id: json['category_id'], name: (json['category_name']), icon: json['icon_link']);
  }

  static List<CategoriesModel> fromJsonList(Map<String, dynamic> json){
    List<CategoriesModel> _categories = new List<CategoriesModel>();
    int _len = json['categories'].length;
    for (var i=0; i<_len; i++){
      _categories.add(CategoriesModel.fromJson(json['categories'][i]));
    }
    return _categories;
  }

  Map<String, dynamic> toJson() {
    return {
      'category_id': super.getID,
      'category_name': super.getName,
      'icon_link': super.getIcon,
    };
  }
}
