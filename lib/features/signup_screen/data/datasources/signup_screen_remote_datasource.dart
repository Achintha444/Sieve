import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sieve_data_privacy_app/core/Entities/empty_entity.dart';

import '../../../../core/Constants/key.dart';
import '../../../../core/Error/exceptions.dart';
import '../models/signup_user_model.dart';

abstract class SignupScreenRemoteDataSource {
  /// Calls the api/user/Signup endpoint
  ///
  /// Throws a [ServerException,InvalidInputException] for all error codes.
  Future<EmptyEntity> getSignupUser(String email, String password);
}

class SignupScreenRemoteDataSourceImpl implements SignupScreenRemoteDataSource {
  final http.Client httpClient;

  SignupScreenRemoteDataSourceImpl({@required this.httpClient});

  @override
  Future<EmptyEntity> getSignupUser(String email, String password) async {
    final response = await httpClient.post(API_URL + "/user/signup",
        body: {'email': email, 'password': password});
        print('aaaaaa');
    if (response.statusCode != 200) {
      final error = json.decode(response.body);
      if(error['serverError']==true){
        throw ServerException();
      }else{
        throw InvalidInputException();
      }
    } else {
      print (json.decode(response.body));
      return EmptyEntity();
    }
  }
}
