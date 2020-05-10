import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sieve_data_privacy_app/core/Constants/key.dart';

import '../models/login_user_model.dart';

abstract class LoginScreenLocalDataSource {
  /// Cache the logged in user for auto login
  Future<void> cacheLoginUser(LoginUserModel user);

  /// Cache the logged in type
  Future<void> cacheGoogle();
  Future<void> cacheFacebook();

  /// Get the logged in type
  String getLoggedinType();

  /// Remove the logged in type
  Future<void> removeCacheLoginType();

  /// Remove the cached user when logout
  Future<void> removeCacheLoginUser();
}

class LoginScreenLocalDataSourceImpl implements LoginScreenLocalDataSource {
  final SharedPreferences sharedPreferences;

  LoginScreenLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<void> cacheLoginUser(LoginUserModel user) {
    return sharedPreferences.setString(
      AUTO_LOGIN_USER_KEY,
      json.encode(
        user.toJson(),
      ),
    );
  }

  @override
  Future<void> cacheGoogle() {
    return sharedPreferences.setString(
      LOGIN_TYPE,
      "Google",
    );
  }

  @override
  Future<void> cacheFacebook() {
    return sharedPreferences.setString(
      LOGIN_TYPE,
      "Facebook",
    );
  }

  @override
  Future<bool> removeCacheLoginUser() {
    return sharedPreferences.remove(AUTO_LOGIN_USER_KEY);
  }

  @override
  Future<void> removeCacheLoginType() {
    return sharedPreferences.remove(LOGIN_TYPE);
  }

  @override
  String getLoggedinType() {
    return sharedPreferences.getString(LOGIN_TYPE);;
  }
}
