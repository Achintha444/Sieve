import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Usecase/use_case.dart';
import '../../../../core/error/Faliure.dart';
import '../entities/login_user.dart';
import '../repos/login_screen_repo.dart';

class GetLogin extends UseCase<LoginUser,List<String>>{
  LoginScreenRepo repo;

  GetLogin({@required this.repo});

  //* var loginDetails = [email,password]
  //* loginDetails[0] == username
  //* loginDetails[1] == password

  @override
  Future<Either<Faliure,LoginUser>> call(List<String> loginDetails) async{
    return await this.repo.getLogin(loginDetails[0],loginDetails[1]);
  }
}