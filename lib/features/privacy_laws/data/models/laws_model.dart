import 'package:flutter/material.dart';

import '../../domain/entities/laws.dart';

class LawsModel extends Laws {
  final String law;
  final String fullLink;
  final String desc;

  LawsModel({@required this.law, @required this.fullLink, @required this.desc})
      : super(law:law, fullLink:fullLink, desc:desc);

  factory LawsModel.fromJson(Map<String, dynamic> json) {
    return LawsModel(law: json['law'], fullLink: json['full_link'], desc: (json['description']));
  }

  static List<LawsModel> fromJsonList(Map<String, dynamic> json){
    List<LawsModel> _laws = new List<LawsModel>();
    int _len = json['laws'].length;
    print (json);
    for (var i=0; i<_len; i++){
      _laws.add(LawsModel.fromJson(json['laws'][i]));
    }
    return _laws;
  }

  Map<String, dynamic> toJson() {
    return {
      'law': super.getLaw,
      'fullLink': super.getFullLink,
      'desc': super.getDesc,
    };
  }
}
