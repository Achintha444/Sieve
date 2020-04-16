import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Platform/network_info.dart';
import '../../../../core/error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/repos/bottom_nav_repo.dart';

class BottomNavRepoImpl implements BottomNavRepo {
  final NetworkInfo networkInfo;

  BottomNavRepoImpl({@required this.networkInfo});

  Future<Either<Faliure, LoginUser>> _navigate(LoginUser user) async {
    if (await networkInfo.isConnected) {
      return Right(user);
    } else {
      return Left(InternetConnectionFaliure());
    }
  }

  @override
  Future<Either<Faliure, LoginUser>> navigateToCategory(LoginUser user) async {
    return await _navigate(user);
  }

  @override
  Future<Either<Faliure, LoginUser>> navigateToDashboard(LoginUser user) async  {
   return await _navigate(user);
  }

  @override
  Future<Either<Faliure, LoginUser>> navigateToNewsFeed(LoginUser user) async {
    return await _navigate(user);
  }

  @override
  Future<Either<Faliure, LoginUser>> navigateToPrivacyLaws(LoginUser user) async {
    return await _navigate(user);
  }

  @override
  Future<Either<Faliure, LoginUser>> navigateToPrivacyTips(LoginUser user) async {
    return await _navigate(user);
  }
}
