import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Entities/empty_entity.dart';
import '../../../../core/Usecase/use_case.dart';
import '../../../../core/error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../repos/bottom_nav_repo.dart';

class NavigateToPrivacyLaws extends UseCase<EmptyEntity,LoginUser>{

  final BottomNavRepo bottomNavRepo;

  NavigateToPrivacyLaws({@required this.bottomNavRepo});
  

  @override
  Future<Either<Faliure, EmptyEntity>> call(LoginUser user) async {
    return await this.bottomNavRepo.navigateToPrivacyLaws(user);
  }
  
}