import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/Constants/key.dart';

import '../../../login_screen/data/models/login_user_model.dart';

abstract class SplashScreenLocalDataSource {
  /// Throws a [CacheException] for all error codes.
  Future<LoginUserModel> autoLogin();
}

class SplashScreenLocalDataSourceImpl implements SplashScreenLocalDataSource {
  final SharedPreferences sharedPreferences;

  SplashScreenLocalDataSourceImpl({@required this.sharedPreferences});

  @override
  Future<LoginUserModel> autoLogin() {
    final String loginUserModelString =
        sharedPreferences.getString(AUTO_LOGIN_USER_KEY);
    if (loginUserModelString != null) {
      return Future.value(
          LoginUserModel.fromJson(json.decode(loginUserModelString)));
    } else {
      //There is an error in throwing this error!
      throw CacheException();
    }
  }
}
