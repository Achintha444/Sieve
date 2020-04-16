import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Usecase/use_case.dart';
import '../../../../core/error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../entities/tips.dart';
import '../repos/privacy_tips_repo.dart';

class LoadPriavacyTips implements UseCase<List<Tips>,LoginUser>{

  final PrivacyTipsRepo privacyTipsRepo;

  LoadPriavacyTips({@required this.privacyTipsRepo});
  

  @override
  Future<Either<Faliure, List<Tips>>> call(LoginUser user) async {
    return await this.privacyTipsRepo.loadPrivacyTips(user) ;
  }
  
}