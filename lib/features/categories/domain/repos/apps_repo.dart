import 'package:dartz/dartz.dart';

import '../../../../core/error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../entities/apps.dart';

abstract class AppsRepo {
  Future <Either<Faliure,List<Apps>>> loadApps(LoginUser user, int categoryId);
}