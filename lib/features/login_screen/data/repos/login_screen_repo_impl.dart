import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Entities/empty_entity.dart';
import '../../../../core/Error/exceptions.dart';
import '../../../../core/Platform/network_info.dart';
import '../../../../core/error/Faliure.dart';
import '../../../login_signup_screen/domain/repos/login_signup_screen_repo.dart';
import '../../domain/entities/login_user.dart';
import '../../domain/repos/login_screen_repo.dart';
import '../datasources/login_screen_remote_datasource.dart';

class LoginScreenRepoImpl implements LoginScreenRepo {
  final LoginSignuScreenRepo loginSignuScreenRepo;
  final LoginScreenRemoteDataSource loginScreenRemoteDataSource;
  final NetworkInfo networkInfo;

  LoginScreenRepoImpl(
      {@required this.loginSignuScreenRepo, @required this.networkInfo,@required this.loginScreenRemoteDataSource});

  @override
  Future<Either<Faliure, EmptyEntity>> getFacebookLogin() async {
    return await this.loginSignuScreenRepo.getFacebookLogin();
  }

  @override
  Future<Either<Faliure, EmptyEntity>> getGoogleLogin() async {
    return await this.loginSignuScreenRepo.getGoogleLogin();
  }

  @override
  Future<Either<Faliure, LoginUser>> getLogin(String email, String password) async {
    if (await networkInfo.isConnected) {
      print ("email is "+email);
      print ("password is "+password);
      try {
        final finalLoginUser = await loginScreenRemoteDataSource.getLoginUser(email, password);
        return Right(finalLoginUser);
      } on ServerException {
        return (Left(ServerFaliure()));
      } on InvalidInputException{
        return (Left(InvalidInputFaliure()));
      }
    } else {
      return Left(InternetConnectionFaliure());
    }
  }
}
