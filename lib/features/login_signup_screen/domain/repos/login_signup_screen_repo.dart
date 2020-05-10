import 'package:dartz/dartz.dart';

import '../../../../core/Entities/empty_entity.dart';
import '../../../../core/error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';

abstract class LoginSignuScreenRepo {
  Future<Either<Faliure,LoginUser>> getGoogleLogin();
  Future<Either<Faliure,EmptyEntity>> getFacebookLogin();
}