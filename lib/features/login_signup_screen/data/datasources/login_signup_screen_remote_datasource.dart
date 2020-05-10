import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;

import '../../../../core/Constants/key.dart';
import '../../../../core/Error/exceptions.dart';
import '../../../login_screen/data/models/login_user_model.dart';

abstract class LoginSignupScreenRemoteDataSource {
  /// Calls the api/user/login endpoint
  ///
  /// Throws a [ServerException,InvalidInputException] for all error codes.
  Future<LoginUserModel> getGoogleLogin(GoogleSignInAccount account);
}

class LoginSignupScreenRemoteDataSourceImpl
    implements LoginSignupScreenRemoteDataSource {

  final http.Client httpClient;

  LoginSignupScreenRemoteDataSourceImpl({@required this.httpClient});

  @override
  Future<LoginUserModel> getGoogleLogin(GoogleSignInAccount account) async {
    try {
      final response = await httpClient.post(API_URL + "/user/signupGF", body: {
        'email': account.email,
        'uid': account.id,
        'imageUrl': account.photoUrl
      });
      if (response.statusCode != 200) {
        final error = json.decode(response.body);
        if (error['serverError'] == true) {
          throw ServerException();
        } else {
          throw InvalidInputException();
        }
      } else {
        return LoginUserModel.fromJsonGoogle(json.decode(response.body));
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
