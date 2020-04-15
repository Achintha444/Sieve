import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../core/Constants/key.dart';
import '../../../../core/Error/exceptions.dart';
import '../models/login_user_model.dart';

abstract class LoginScreenRemoteDataSource {
  /// Calls the api/user/login endpoint
  ///
  /// Throws a [ServerException,InvalidInputException] for all error codes.
  Future<LoginUserModel> getLoginUser(String email, String password);
}

class LoginScreenRemoteDataSourceImpl implements LoginScreenRemoteDataSource {
  final http.Client httpClient;

  LoginScreenRemoteDataSourceImpl({@required this.httpClient});

  @override
  Future<LoginUserModel> getLoginUser(String email, String password) async {
    final response = await httpClient.post(API_URL + "/user/login",
        body: {'email': email, 'password': password});
    if (response.statusCode != 200) {
      final error = json.decode(response.body);
      if(error['serverError']==true){
        throw ServerException();
      }else{
        throw InvalidInputException();
      }
    } else {
      return LoginUserModel.fromJson(json.decode(response.body));
    }
  }
}
