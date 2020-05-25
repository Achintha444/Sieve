import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../core/Constants/key.dart';
import '../../../../core/error/exceptions.dart';
import '../models/apps_model.dart';

abstract class AppsRemoteDatasource {
  /// Calls the api/user/login endpoint
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<AppsModel>> loadApps(int categoryId);
}

class AppsRemoteDatasourceImpl
    implements AppsRemoteDatasource {
  final http.Client httpClient;

  AppsRemoteDatasourceImpl({@required this.httpClient});

  @override
  Future<List<AppsModel>> loadApps(int categoryId) async {
    final response = await httpClient.post(API_URL + "/apps/view_all", body: {'category_id': categoryId});
    if (response.statusCode != 200) {
      throw ServerException();
      // final error = json.decode(response.body);
      // if(error['serverError']==true){
      //   throw ServerException();
      // }else{
      //   throw InvalidInputException();
      // }
    } else {
      print(json.decode(response.body));
      return AppsModel.fromJsonList(json.decode(response.body));
    }
  }
}
