import 'package:dartz/dartz.dart';

import '../../../../core/Error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../entities/tips.dart';

abstract class PrivacyTipsRepo {
  Future <Either<Faliure,List<Tips>>> loadNews(LoginUser user);
}