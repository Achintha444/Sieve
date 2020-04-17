import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Entities/empty_entity.dart';
import '../../../../core/Platform/network_info.dart';
import '../../../../core/error/Faliure.dart';
import '../../../../core/error/exceptions.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/repos/splash_screen_repo.dart';
import '../datasources/splash_screen_local_datasource.dart';

class SplashScreenRepoImpl implements SplashScreenRepo {
  final NetworkInfo networkInfo;
  final SplashScreenLocalDataSource splashScreenLocalDataSource;

  SplashScreenRepoImpl(
      {@required this.networkInfo, @required this.splashScreenLocalDataSource});
  @override
  Future<Either<Faliure, EmptyEntity>> navigateToLoginScreen() async {
    if (await networkInfo.isConnected) {
      return Right(EmptyEntity());
    } else {
      return Left(InternetConnectionFaliure());
    }
  }

  @override
  Future<Either<Faliure, LoginUser>> autoLogin() async {
    await Future.delayed(Duration(seconds: 4));
    if (await networkInfo.isConnected) {
      try {
        final lgoinUser = await this.splashScreenLocalDataSource.autoLogin();
        await Future.delayed(Duration(seconds: 1));
        return Right(lgoinUser);
      } on CacheException {
        return Left(CacheFaliure());
      }
    } else {
      return Left(InternetConnectionFaliure());
    }
  }
}
