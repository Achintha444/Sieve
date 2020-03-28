import 'package:dartz/dartz.dart';

import '../../../../core/Entities/empty_entity.dart';
import '../../../../core/error/Faliure.dart';

abstract class LoginSignuScreenRepo {
  Future<Either<Faliure,EmptyEntity>> getLoginScreen();
  Future<Either<Faliure,EmptyEntity>> getSignupScreen();
  Future<Either<Faliure,EmptyEntity>> getGoogleLogin();
  Future<Either<Faliure,EmptyEntity>> getFacebookLogin();
}