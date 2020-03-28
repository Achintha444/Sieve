import 'package:dartz/dartz.dart';

import '../../../../core/Entities/empty_entity.dart';
import '../../../../core/error/Faliure.dart';

abstract class SplashScreenRepo {
  Future<Either<Faliure,EmptyEntity>> navigateToLoginScreen();
}