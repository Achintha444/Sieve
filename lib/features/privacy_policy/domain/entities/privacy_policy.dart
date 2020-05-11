import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class PrivacyPolicy extends Equatable {
  final List<String> types;
  final List<String> usages;
  final List<String> removal;
  final String contactLink;
  final String email;
  final String fiLine;
  final String sLine;
  final String tLine;
  final String foLine;

  PrivacyPolicy(
      {@required this.types,
      @required this.usages,
      @required this.removal,
      @required this.contactLink,
      @required this.email,
      @required this.fiLine,
      @required this.sLine,
      @required this.tLine,
      @required this.foLine})
      : super([
          types,
          usages,
          removal,
          contactLink,
          email,
          fiLine,
          sLine,
          tLine,
          foLine
        ]);

  List<String> get getTypes {
    return this.types;
  }

  List<String> get getUsages {
    return this.usages;
  }

  List<String> get getRemoval {
    return this.removal;
  }

  String get getContactLink {
    return this.contactLink;
  }

  String get getEmail {
    return this.email;
  }

  String get getFiLine {
    return this.fiLine;
  }

  String get getSLine {
    return this.sLine;
  }

  String get getTLine {
    return this.tLine;
  }

  String get getFoLine {
    return this.foLine;
  }
}
