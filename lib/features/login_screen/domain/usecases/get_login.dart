import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Entities/empty_entity.dart';
import '../../../../core/Usecase/use_case.dart';
import '../../../../core/error/Faliure.dart';
import '../repos/login_screen_repo.dart';

class GetLogin extends UseCase<EmptyEntity,NoParams>{
  LoginScreenRepo repo;

  GetLogin({@required this.repo});

  Future<Either<Faliure,EmptyEntity>> call(NoParams params) async{
    return await this.repo.getLogin();
  }
}