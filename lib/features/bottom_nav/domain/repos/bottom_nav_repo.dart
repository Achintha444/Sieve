import 'package:dartz/dartz.dart';

import '../../../../core/error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';

abstract class BottomNavRepo{
  Future<Either<Faliure,LoginUser>> navigateToNewsFeed(LoginUser user);
  Future<Either<Faliure,LoginUser>> navigateToCategory(LoginUser user);
  Future<Either<Faliure,LoginUser>> navigateToDashboard(LoginUser user);
  Future<Either<Faliure,LoginUser>> navigateToPrivacyLaws(LoginUser user);
  Future<Either<Faliure,LoginUser>> navigateToPrivacyTips(LoginUser user);
}