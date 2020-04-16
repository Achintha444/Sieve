import 'package:dartz/dartz.dart';

import '../../../../core/Entities/empty_entity.dart';
import '../../../../core/error/Faliure.dart';

abstract class SignupScreenRepo {
  Future<Either<Faliure,EmptyEntity>> getSignup(String email,String password);
}