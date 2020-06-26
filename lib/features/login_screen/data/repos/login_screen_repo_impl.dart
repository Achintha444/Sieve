import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Error/exceptions.dart';
import '../../../../core/Platform/network_info.dart';
import '../../../../core/error/Faliure.dart';
import '../../../login_signup_screen/domain/repos/login_signup_screen_repo.dart';
import '../../domain/entities/login_user.dart';
import '../../domain/repos/login_screen_repo.dart';
import '../datasources/login_screen_local_datasource.dart';
import '../datasources/login_screen_remote_datasource.dart';

class LoginScreenRepoImpl implements LoginScreenRepo {
  final LoginSignuScreenRepo loginSignuScreenRepo;
  final LoginScreenRemoteDataSource loginScreenRemoteDataSource;
  final LoginScreenLocalDataSource loginScreenLocalDataSource;
  final NetworkInfo networkInfo;

  LoginScreenRepoImpl(
      {@required this.loginSignuScreenRepo,
      @required this.networkInfo,
      @required this.loginScreenRemoteDataSource,
      @required this.loginScreenLocalDataSource});

  @override
  Future<Either<Faliure, LoginUser>> getFacebookLogin() async {
    return await this.loginSignuScreenRepo.getFacebookLogin();
  }

  @override
  Future<Either<Faliure, LoginUser>> getGoogleLogin() async {
    return await this.loginSignuScreenRepo.getGoogleLogin();
  }

  @override
  Future<Either<Faliure, LoginUser>> getLogin(
      String email, String password) async {
    if (await networkInfo.isConnected) {
      print("email is " + email);
      print("password is " + password);
      try {
        final finalLoginUser =
            await loginScreenRemoteDataSource.getLoginUser(email, password);
        print(finalLoginUser.getEmail);
        await this.loginScreenLocalDataSource.cacheLoginUser(finalLoginUser);
        //await Future.delayed(Duration(seconds: 2));
        return Right(finalLoginUser);
      } on InvalidInputException {
        print('xsxsx');
        return (Left(InvalidInputFaliure()));
      } on ServerException {
        print('xsxsx-1');
        return (Left(ServerFaliure()));
      } on UserBlockedException {
         return (Left(UserBlockedFaliure()));
      }
    } else {
      return Left(InternetConnectionFaliure());
    }
  }
}
