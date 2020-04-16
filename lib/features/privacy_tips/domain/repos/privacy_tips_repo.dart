import 'package:dartz/dartz.dart';

import '../../../../core/error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../entities/tips.dart';

abstract class PrivacyTipsRepo {
  Future <Either<Faliure,List<Tips>>> loadPrivacyTips(LoginUser user);
}