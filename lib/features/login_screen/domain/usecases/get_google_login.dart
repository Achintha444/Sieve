import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/Usecase/use_case.dart';
import '../../../../core/error/Faliure.dart';
import '../entities/login_user.dart';
import '../repos/login_screen_repo.dart';

class GetGoogleLogin implements UseCase<LoginUser,GoogleSignInAccount>{

  final LoginScreenRepo loginRepo;

  GetGoogleLogin({@required this.loginRepo});

  @override
  Future<Either<Faliure, LoginUser>> call(GoogleSignInAccount account) async{
    return await this.loginRepo.getGoogleLogin(account);
  }
  
}