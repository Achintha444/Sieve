import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/Usecase/use_case.dart';
import '../../../../core/error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../repos/login_signup_screen_repo.dart';

class GetGoogleLogin implements UseCase<LoginUser,GoogleSignInAccount>{

  final LoginSignuScreenRepo loginSignuScreenRepo;

  GetGoogleLogin({@required this.loginSignuScreenRepo});

  @override
  Future<Either<Faliure, LoginUser>> call(GoogleSignInAccount account) async{
    return await this.loginSignuScreenRepo.getGoogleLogin(account);
  }
  
}