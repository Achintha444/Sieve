import 'package:dartz/dartz.dart';

import '../../../../core/error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../entities/laws.dart';

abstract class PrivacyLawsRepo {
  Future<Either<Faliure, List<Laws>>> loadPrivacyLaws(LoginUser user);
}
