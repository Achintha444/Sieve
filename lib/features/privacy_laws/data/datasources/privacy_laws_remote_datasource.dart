import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../core/Constants/key.dart';
import '../../../../core/error/exceptions.dart';
import '../models/laws_model.dart';

abstract class PrivacyLawsRemoteDatasource {
  /// Calls the api/user/login endpoint
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<LawsModel>> loadPrivacyLaws();
}

class PrivacyLawsRemoteDatasourceImpl implements PrivacyLawsRemoteDatasource {
  final http.Client httpClient;

  PrivacyLawsRemoteDatasourceImpl({@required this.httpClient});

  @override
  Future<List<LawsModel>> loadPrivacyLaws() async {
    try {
      final response =
          await httpClient.post(API_URL + "/privacy_laws/view_all");
      if (response.statusCode != 200) {
        throw ServerException();
        // final error = json.decode(response.body);
        // if(error['serverError']==true){
        //   throw ServerException();
        // }else{
        //   throw InvalidInputException();
        // }
      } else {
        return LawsModel.fromJsonList(json.decode(response.body));
      }
    } catch (e) {
      print(e);
      throw ServerException();
    }
  }
}
