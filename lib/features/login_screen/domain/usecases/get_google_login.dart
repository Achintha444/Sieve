import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Entities/empty_entity.dart';
import '../../../../core/Usecase/use_case.dart';
import '../../../../core/error/Faliure.dart';
import '../repos/login_screen_repo.dart';

class GetGoogleLogin implements UseCase<EmptyEntity,NoParams>{

  final LoginScreenRepo loginRepo;

  GetGoogleLogin({@required this.loginRepo});

  @override
  Future<Either<Faliure, EmptyEntity>> call(NoParams params) async{
    return await this.loginRepo.getGoogleLogin();
  }
  
}