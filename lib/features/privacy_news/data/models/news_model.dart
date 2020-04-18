import 'package:flutter/material.dart';

import '../../domain/entities/News.dart';

class NewsModel extends News {
  final String law;
  final String fullLink;
  final String desc;

  NewsModel({@required this.law, @required this.fullLink, @required this.desc})
      : super(law:law, fullLink:fullLink, desc:desc);

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(law: json['law'], fullLink: json['full_link'], desc: (json['description']));
  }

  static List<NewsModel> fromJsonList(Map<String, dynamic> json){
    List<NewsModel> _news = new List<NewsModel>();
    int _len = json['news'].length;
    for (var i=0; i<_len; i++){
      _news.add(NewsModel.fromJson(json['News'][i]));
    }
    return _news;
  }

  Map<String, dynamic> toJson() {
    return {
      'law': super.getLaw,
      'fullLink': super.getFullLink,
      'desc': super.getDesc,
    };
  }
}
