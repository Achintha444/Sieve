import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../core/Constants/key.dart';
import '../../../../core/error/exceptions.dart';
import '../models/privacy_policy_model.dart';

abstract class PrivacyPolicyRemoteDatasource {
  /// Calls the api/user/login endpoint
  ///
  /// Throws a [ServerException] for all error codes.
  Future<PrivacyPolicyModel> loadPrivacyPolicy(String id);
}

class PrivacyPolicyRemoteDatasourceImpl
    implements PrivacyPolicyRemoteDatasource {
  final http.Client httpClient;

  PrivacyPolicyRemoteDatasourceImpl({@required this.httpClient});

  @override
  Future<PrivacyPolicyModel> loadPrivacyPolicy(String id) async {
    try {
      final response = await httpClient
          .post(API_URL + "/privacy_policy/view_all", body: {'id': id});
      if (response.statusCode != 200) {
        throw ServerException();
        // final error = json.decode(response.body);
        // if(error['serverError']==true){
        //   throw ServerException();
        // }else{
        //   throw InvalidInputException();
        // }
      } else {
        return PrivacyPolicyModel.fromJson(json.decode(response.body));
      }
    } catch (e) {
      print(e);
      throw ServerException();
    }
  }
}
