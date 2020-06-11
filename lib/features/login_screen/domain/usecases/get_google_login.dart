import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Usecase/use_case.dart';
import '../../../../core/error/Faliure.dart';
import '../entities/login_user.dart';
import '../repos/login_screen_repo.dart';

class GetGoogleLogin implements UseCase<LoginUser,NoParams>{

  final LoginScreenRepo loginRepo;

  GetGoogleLogin({@required this.loginRepo});

  @override
  Future<Either<Faliure, LoginUser>> call(NoParams params) async{
    return await this.loginRepo.getGoogleLogin();
  }
  
}