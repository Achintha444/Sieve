import 'package:dartz/dartz.dart';

import '../../../../core/Entities/empty_entity.dart';
import '../../../../core/error/Faliure.dart';
import '../entities/login_user.dart';

abstract class LoginScreenRepo {
  Future<Either<Faliure, LoginUser>> getLogin(String email, String password);
  Future<Either<Faliure, EmptyEntity>> getGoogleLogin();
  Future<Either<Faliure, EmptyEntity>> getFacebookLogin();
}
