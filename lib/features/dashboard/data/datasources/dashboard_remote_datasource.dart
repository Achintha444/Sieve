import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../core/Constants/key.dart';
import '../../../../core/error/exceptions.dart';
import '../models/dapp_model.dart';

abstract class DashboardRemoteDatasource {
  /// Calls the api/user/login endpoint
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<DappModel>> loadDashboard();
}

class DashboardRemoteDatasourceImpl implements DashboardRemoteDatasource {
  final http.Client httpClient;

  DashboardRemoteDatasourceImpl({@required this.httpClient});

  @override
  Future<List<DappModel>> loadDashboard() async {
    try {
      final response = await httpClient.post(API_URL + "/dashboard/view_all");
      if (response.statusCode != 200) {
        throw ServerException();
        // final error = json.decode(response.body);
        // if(error['serverError']==true){
        //   throw ServerException();
        // }else{
        //   throw InvalidInputException();
        // }
      } else {
        return DappModel.fromJsonList(json.decode(response.body));
      }
    } on SocketException catch (e) {
      print(e);
      throw ServerException();
    }
  }
}
