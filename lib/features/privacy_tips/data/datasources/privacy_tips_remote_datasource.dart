import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../core/Constants/key.dart';
import '../../../../core/error/exceptions.dart';
import '../models/tips_model.dart';

abstract class PrivacyTipsRemoteDatasource {
  /// Calls the api/user/login endpoint
  ///
  /// Throws a [ServerException,InvalidInputException] for all error codes.
  Future<List<TipsModel>> loadPrivacyTips();
}

class PrivacyTipsRemoteDatasourceImpl implements PrivacyTipsRemoteDatasource{
  
  final http.Client httpClient;

  PrivacyTipsRemoteDatasourceImpl({@required this.httpClient});

  @override
  Future<List<TipsModel>> loadPrivacyTips() async{
    final response = await httpClient.post(API_URL + "/privacy_tips/view_all");
    if (response.statusCode != 200) {
      throw ServerException();
      // final error = json.decode(response.body);
      // if(error['serverError']==true){
      //   throw ServerException();
      // }else{
      //   throw InvalidInputException();
      // }
    } else {
      return TipsModel.fromJsonList(json.decode(response.body));
    }
  }
  
  
}