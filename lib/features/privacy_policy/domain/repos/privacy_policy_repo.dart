import 'package:dartz/dartz.dart';

import '../../../../core/error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../entities/privacy_policy.dart';

abstract class PrivacyPolicyRepo{
  Future<Either<Faliure, PrivacyPolicy>> getPrivacyPolicy(String id, LoginUser user);
}