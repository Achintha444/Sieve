import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Entities/empty_entity.dart';
import '../../../../core/Platform/network_info.dart';
import '../../../../core/error/Faliure.dart';
import '../../domain/repos/login_signup_screen_repo.dart';

class LoginSignupScreenRepoImpl implements LoginSignuScreenRepo {
  final NetworkInfo networkInfo;

  LoginSignupScreenRepoImpl({@required this.networkInfo});

  @override
  Future<Either<Faliure, EmptyEntity>> getFacebookLogin() async {
    if (await networkInfo.isConnected) {
      return Right(EmptyEntity());
    } else {
      return Left(InternetConnectionFaliure());
    }
  }

  @override
  Future<Either<Faliure, EmptyEntity>> getGoogleLogin() async {
    if (await networkInfo.isConnected) {
      return Right(EmptyEntity());
    } else {
      return Left(InternetConnectionFaliure());
    }
  }
}
