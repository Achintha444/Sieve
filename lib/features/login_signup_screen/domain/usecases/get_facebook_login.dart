import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Entities/empty_entity.dart';
import '../../../../core/Usecase/use_case.dart';
import '../../../../core/error/Faliure.dart';
import '../repos/login_signup_screen_repo.dart';

class GetFacebookLogin implements UseCase<EmptyEntity,NoParams>{

  final LoginSignuScreenRepo loginSignuScreenRepo;

  GetFacebookLogin({@required this.loginSignuScreenRepo});

  @override
  Future<Either<Faliure, EmptyEntity>> call(NoParams params) async{
    return await this.loginSignuScreenRepo.getFacebookLogin();
  }
  
}