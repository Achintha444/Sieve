import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:sieve_data_privacy_app/core/Error/exceptions.dart';
import 'package:sieve_data_privacy_app/core/Platform/network_info.dart';
import 'package:sieve_data_privacy_app/features/signup_screen/data/datasources/signup_screen_remote_datasource.dart';

import '../../../../core/Entities/empty_entity.dart';
import '../../../../core/error/Faliure.dart';
import '../../domain/repos/signup_screen_repo.dart';

class SignupScreenRepoImpl extends SignupScreenRepo {
  final NetworkInfo networkInfo;
  final SignupScreenRemoteDataSource signupScreenRemoteDataSource;

  SignupScreenRepoImpl({@required this.networkInfo,@required this.signupScreenRemoteDataSource});

  @override
  Future<Either<Faliure, EmptyEntity>> getSignup(
      String email, String password) async {
    if (await networkInfo.isConnected) {
      print("email is " + email);
      print("password is " + password);
      try{
        final finalSignupUser = await signupScreenRemoteDataSource.getSignupUser(email, password);
        return Right(finalSignupUser);
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
