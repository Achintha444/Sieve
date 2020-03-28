import 'package:dartz/dartz.dart';

import '../../../../core/Entities/empty_entity.dart';
import '../../../../core/error/Faliure.dart';
import '../../domain/repos/login_signup_screen_repo.dart';

class LoginSignupScreenRepoImpl implements LoginSignuScreenRepo{
  @override
  Future<Either<Faliure, EmptyEntity>> getFacebookLogin() {
    // TODO: implement getFacebookLogin
    return null;
  }

  @override
  Future<Either<Faliure, EmptyEntity>> getGoogleLogin() {
    // TODO: implement getGoogleLogin
    return null;
  }

  
}