import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../core/Constants/key.dart';
import '../../../../core/error/exceptions.dart';
import '../models/login_user_model.dart';

abstract class LoginScreenRemoteDataSource {
  /// Calls the api/user/login endpoint
  ///
  /// Throws a [ServerException] for all error codes.
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
      throw ServerException();
    } else {
      return LoginUserModel.fromJson(json.decode(response.body));
    }
  }
}
