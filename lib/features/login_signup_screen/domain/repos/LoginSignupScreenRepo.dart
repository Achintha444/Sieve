import 'package:dartz/dartz.dart';
import 'package:sieve_data_privacy_app/core/Entities/empty_entity.dart';
import 'package:sieve_data_privacy_app/core/Error/Faliure.dart';

abstract class LoginSignuScreenRepo {
  Future<Either<Faliure,EmptyEntity>> getLoginScreen();
  Future<Either<Faliure,EmptyEntity>> getSignupScreen();
  Future<Either<Faliure,EmptyEntity>> getGoogleLogin();
  Future<Either<Faliure,EmptyEntity>> getFacebookLogin();
}