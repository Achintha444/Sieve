import 'package:flutter/material.dart';

import '../../domain/entities/privacy_policy.dart';

class PrivacyPolicyModel extends PrivacyPolicy {
  final List<String> types;
  final List<String> usages;
  final List<String> removal;
  final String contactLink;
  final String email;
  final String fiLine;
  final String sLine;
  final String tLine;
  final String foLine;

  PrivacyPolicyModel({
    @required this.types,
    @required this.usages,
    @required this.removal,
    @required this.contactLink,
    @required this.email,
    @required this.fiLine,
    @required this.sLine,
    @required this.tLine,
    @required this.foLine,
  }) : super(
            types: types,
            usages: usages,
            removal: removal,
            contactLink: contactLink,
            email: email,
            fiLine: fiLine,
            sLine: sLine,
            tLine: tLine,
            foLine: foLine);

  factory PrivacyPolicyModel.fromJson(Map<String, dynamic> json) {
    return PrivacyPolicyModel(
        types: PrivacyPolicyModel._fromJsonListTypes(json),
        usages: PrivacyPolicyModel._fromJsonListUsages(json),
        removal: PrivacyPolicyModel._fromJsonListRemovals(json),
        contactLink: json['contact_link'],
        email: json['email'],
        fiLine: json['first_line'],
        sLine: json['second_line'],
        tLine: json['third_line'],
        foLine: json['fourth_line']);
  }

  static List<String> _fromJsonListString(
    Map<String, dynamic> json,
    String str,
    String type,
  ) {
    List<String> _list = new List<String>();
    int _len = json[str].length;
    for (var i = 0; i < _len; i++) {
      _list.add((json[str][i][type]));
    }
    return _list;
  }

  static List<String> _fromJsonListTypes(Map<String, dynamic> json) {
    return PrivacyPolicyModel._fromJsonListString(
        json, 'types', 'data_type_name');
  }

  static List<String> _fromJsonListUsages(Map<String, dynamic> json) {
    return PrivacyPolicyModel._fromJsonListString(json, 'usages', 'policy');
  }

  static List<String> _fromJsonListRemovals(Map<String, dynamic> json) {
    return PrivacyPolicyModel._fromJsonListString(json, 'removals', 'policy');
  }

  Map<String, dynamic> toJson() {
    return {
      'types': super.getTypes,
      'usages': super.getUsages,
      'removals': super.getRemoval,
      'contact_link': super.getContactLink,
      'email': super.getEmail,
      'first_line': super.getFiLine,
      'second_line': super.getSLine,
      'third_line': super.getTLine,
      'fourth_line': super.getFoLine,
    };
  }
}
