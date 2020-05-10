import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/Entities/empty_entity.dart';
import '../../../../core/error/Faliure.dart';
import '../entities/login_user.dart';

abstract class LoginScreenRepo {
  Future<Either<Faliure, LoginUser>> getLogin(String email, String password);
  Future<Either<Faliure, LoginUser>> getGoogleLogin(GoogleSignInAccount account);
  Future<Either<Faliure, EmptyEntity>> getFacebookLogin();
}
