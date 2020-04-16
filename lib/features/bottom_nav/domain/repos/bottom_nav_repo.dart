import 'package:dartz/dartz.dart';

import '../../../../core/Entities/empty_entity.dart';
import '../../../../core/error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';

abstract class BottomNavRepo{
  Future<Either<Faliure,EmptyEntity>> navigateToNewsFeed(LoginUser user);
  Future<Either<Faliure,EmptyEntity>> navigateToCategory(LoginUser user);
  Future<Either<Faliure,EmptyEntity>> navigateToDashboard(LoginUser user);
  Future<Either<Faliure,EmptyEntity>> navigateToPrivacyLaws(LoginUser user);
  Future<Either<Faliure,EmptyEntity>> navigateToPrivacyTips(LoginUser user);
}