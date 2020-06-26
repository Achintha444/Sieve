import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/Platform/network_info.dart';
import '../../../../core/error/Faliure.dart';
import '../../../login_screen/data/datasources/login_screen_local_datasource.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/repos/login_signup_screen_repo.dart';
import '../datasources/login_signup_screen_remote_datasource.dart';

class LoginSignupScreenRepoImpl implements LoginSignuScreenRepo {
  final NetworkInfo networkInfo;
  final LoginSignupScreenRemoteDataSource loginSignupScreenRemoteDataSource;
  final LoginScreenLocalDataSource loginScreenLocalDataSource;

  LoginSignupScreenRepoImpl({@required this.networkInfo,@required this.loginSignupScreenRemoteDataSource,@required this.loginScreenLocalDataSource});

  @override
  Future<Either<Faliure, LoginUser>> getFacebookLogin() async {
    if (await networkInfo.isConnected) {
      try{
        final user = await loginSignupScreenRemoteDataSource.getFacebookLogin();
        print (user);
        print ('aaaa');
        await this.loginScreenLocalDataSource.cacheFacebook();
        await this.loginScreenLocalDataSource.cacheLoginUser(user);
        return Right(user);
      }on ServerException{
        // await this.loginScreenLocalDataSource.removeCacheLoginType();
        // await this.loginScreenLocalDataSource.removeCacheLoginUser();
        return Left(ServerFaliure());
      } on UserBlockedException {
        return Left(UserBlockedFaliure());
      }
    } else {
      return Left(InternetConnectionFaliure());
    }
  }

  //3pQizynLMbaydM6qz1m8yAPCoQQ=

  @override
  Future<Either<Faliure, LoginUser>> getGoogleLogin() async {
    if (await networkInfo.isConnected) {
      try{
        final user = await loginSignupScreenRemoteDataSource.getGoogleLogin();
        print (user);
        print ('aaaa');
        await this.loginScreenLocalDataSource.cacheGoogle();
        await this.loginScreenLocalDataSource.cacheLoginUser(user);
        return Right(user);
      }on ServerException{
        // await this.loginScreenLocalDataSource.removeCacheLoginType();
        // await this.loginScreenLocalDataSource.removeCacheLoginUser();
        return Left(ServerFaliure());
      } on UserBlockedException {
        return Left(UserBlockedFaliure());
      }
    } else {
      return Left(InternetConnectionFaliure());
    }
  }
}
