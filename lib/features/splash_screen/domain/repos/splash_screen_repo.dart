import 'package:dartz/dartz.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';

import '../../../../core/Entities/empty_entity.dart';
import '../../../../core/error/Faliure.dart';

abstract class SplashScreenRepo {
  Future<Either<Faliure,EmptyEntity>> navigateToLoginScreen();
  Future<Either<Faliure,LoginUser>> autoLogin();
}