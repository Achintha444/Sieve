import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import '../../../../core/Usecase/use_case.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../repos/splash_screen_repo.dart';

class AutoLogin implements UseCase<LoginUser,NoParams>{
  SplashScreenRepo _splashScreenRepo;

  AutoLogin({@required SplashScreenRepo splashScreenRepo}) {
    this._splashScreenRepo = splashScreenRepo;
  }

  @override
  Future<Either<Faliure, LoginUser>> call(NoParams params) async{
    return await this._splashScreenRepo.autoLogin();
  }
}