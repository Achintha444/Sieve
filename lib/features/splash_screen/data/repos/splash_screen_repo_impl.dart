import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Platform/network_info.dart';
import '../../../../core/error/Faliure.dart';
import '../../domain/entities/empty_entity.dart';
import '../../domain/repos/splash_screen_repo.dart';

class SplashScreenRepoImpl implements SplashScreenRepo {
  NetworkInfo networkInfo;

  SplashScreenRepoImpl({@required this.networkInfo}) ;
  @override
  Future<Either<Faliure, EmptyEntity>> navigateToLoginScreen() async {
    await Future.delayed(
      Duration(seconds: 4),
    );
    if (await networkInfo.isConnected) {
      return Right(EmptyEntity());
    } else {
      return Left(InternetConnectionFaliure());
    }
  }
}
