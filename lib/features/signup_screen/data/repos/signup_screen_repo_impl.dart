import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:sieve_data_privacy_app/core/Error/exceptions.dart';
import 'package:sieve_data_privacy_app/core/Platform/network_info.dart';

import '../../../../core/Entities/empty_entity.dart';
import '../../../../core/error/Faliure.dart';
import '../../domain/repos/signup_screen_repo.dart';

class SignupScreenRepoImpl extends SignupScreenRepo {
  final NetworkInfo networkInfo;

  SignupScreenRepoImpl({@required this.networkInfo});

  @override
  Future<Either<Faliure, EmptyEntity>> getSignup(
      String email, String password) async {
    if (await networkInfo.isConnected) {
      print("email is " + email);
      print("password is " + password);
      try{
        return Right(EmptyEntity());
      }on ServerException{
        return Left(ServerFaliure());
      }on InvalidInputException{
        return Left(InvalidInputFaliure());
      }
    } else {
      return Left(InternetConnectionFaliure());
    }
  }
}
