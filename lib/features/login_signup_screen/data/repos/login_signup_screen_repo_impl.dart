import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/Entities/empty_entity.dart';
import '../../../../core/Error/exceptions.dart';
import '../../../../core/Platform/network_info.dart';
import '../../../../core/error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/repos/login_signup_screen_repo.dart';
import '../datasources/login_signup_screen_remote_datasource.dart';

class LoginSignupScreenRepoImpl implements LoginSignuScreenRepo {
  final NetworkInfo networkInfo;
  final LoginSignupScreenRemoteDataSource loginSignupScreenRemoteDataSource;

  LoginSignupScreenRepoImpl({@required this.networkInfo,@required this.loginSignupScreenRemoteDataSource});

  @override
  Future<Either<Faliure, EmptyEntity>> getFacebookLogin() async {
    if (await networkInfo.isConnected) {
      return Right(EmptyEntity());
    } else {
      return Left(InternetConnectionFaliure());
    }
  }

  //3pQizynLMbaydM6qz1m8yAPCoQQ=

  @override
  Future<Either<Faliure, LoginUser>> getGoogleLogin(GoogleSignInAccount account) async {
    if (await networkInfo.isConnected) {
      try{
        final user = await loginSignupScreenRemoteDataSource.getGoogleLogin(account);
        return Right(user);
      }on ServerException{
        return Left(ServerFaliure());
      }
    } else {
      return Left(InternetConnectionFaliure());
    }
  }
}
