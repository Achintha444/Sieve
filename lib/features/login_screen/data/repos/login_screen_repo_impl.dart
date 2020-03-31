import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Entities/empty_entity.dart';
import '../../../../core/Platform/network_info.dart';
import '../../../../core/error/Faliure.dart';
import '../../../login_signup_screen/domain/repos/login_signup_screen_repo.dart';
import '../../domain/repos/login_screen_repo.dart';

class LoginScreenRepoImpl implements LoginScreenRepo {
  final LoginSignuScreenRepo loginSignuScreenRepo;
  final NetworkInfo networkInfo;

  LoginScreenRepoImpl(
      {@required this.loginSignuScreenRepo, @required this.networkInfo});

  @override
  Future<Either<Faliure, EmptyEntity>> getFacebookLogin() async {
    return await this.loginSignuScreenRepo.getFacebookLogin();
  }

  @override
  Future<Either<Faliure, EmptyEntity>> getGoogleLogin() async {
    return await this.loginSignuScreenRepo.getGoogleLogin();
  }

  @override
  Future<Either<Faliure, EmptyEntity>> getLogin(String email, String password) async {
    if (await networkInfo.isConnected) {
      print ("email is "+email);
      print ("password is "+password);
      return Right(EmptyEntity());
    } else {
      return Left(InternetConnectionFaliure());
    }
  }
}
