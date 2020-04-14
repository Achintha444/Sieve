import 'package:dartz/dartz.dart';

import '../../../../core/Entities/empty_entity.dart';
import '../../../../core/error/Faliure.dart';

abstract class LoginScreenRepo {
  Future<Either<Faliure, EmptyEntity>> getLogin(String email, String password);
  Future<Either<Faliure, EmptyEntity>> getGoogleLogin();
  Future<Either<Faliure, EmptyEntity>> getFacebookLogin();
}