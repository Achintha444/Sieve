import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Usecase/use_case.dart';
import '../../../../core/error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../repos/login_signup_screen_repo.dart';

class GetFacebookLogin implements UseCase<LoginUser,NoParams>{

  final LoginSignuScreenRepo loginSignuScreenRepo;

  GetFacebookLogin({@required this.loginSignuScreenRepo});

  @override
  Future<Either<Faliure, LoginUser>> call(NoParams params) async{
    return await this.loginSignuScreenRepo.getFacebookLogin();
  }
  
}