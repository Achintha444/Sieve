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
    try {
      final response = await httpClient.post(API_URL + "/user/login",
          body: {'email': email, 'password': password});
      if (response.statusCode != 200) {
        final error = json.decode(response.body);
        print (error);
        if (error['serverError'] == true) {
          throw ServerException();
        } else if (error['blockedError']==true){
          throw UserBlockedException();
        } else {
          print('object');
          throw InvalidInputException();
        }
      } else {
        return LoginUserModel.fromJson(json.decode(response.body));
      }
    } catch (e) {
      if (e.runtimeType==InvalidInputException){
        throw InvalidInputException();
      } else if (e.runtimeType==UserBlockedException){
        throw UserBlockedException();
      }throw ServerException();
    }
  }
}
