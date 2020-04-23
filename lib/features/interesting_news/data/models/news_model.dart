import 'package:flutter/material.dart';

import '../../domain/entities/news.dart';

class NewsModel extends News {
  final String title;
  final String desc;
  final String fullLink;

  NewsModel({@required this.title, @required this.desc,@required this.fullLink})
      : super(title:title,desc:desc, fullLink: fullLink);

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(title: json['news'], desc: (json['description']),fullLink: json['full_link']);
  }

  static List<NewsModel> fromJsonList(Map<String, dynamic> json){
    List<NewsModel> _news = new List<NewsModel>();
    int _len = json['news'].length;
    print(json);
    for (var i=0; i<_len; i++){
      _news.add(NewsModel.fromJson(json['news'][i]));
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
