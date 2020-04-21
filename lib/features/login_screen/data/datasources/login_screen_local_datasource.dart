import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sieve_data_privacy_app/core/Constants/key.dart';

import '../models/login_user_model.dart';

abstract class LoginScreenLocalDataSource {
  /// Cache the logged in user for auto login
  Future<void> cacheLoginUser(LoginUserModel user);

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
  Future<bool> removeCacheLoginUser() {
    return sharedPreferences.remove(AUTO_LOGIN_USER_KEY);
  }
}
