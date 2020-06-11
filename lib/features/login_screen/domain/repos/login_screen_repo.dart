import 'package:dartz/dartz.dart';

import '../../../../core/error/Faliure.dart';
import '../entities/login_user.dart';

abstract class LoginScreenRepo {
  Future<Either<Faliure, LoginUser>> getLogin(String email, String password);
  Future<Either<Faliure, LoginUser>> getGoogleLogin();
  Future<Either<Faliure, LoginUser>> getFacebookLogin();
}
