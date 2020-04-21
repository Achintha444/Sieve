import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Usecase/use_case.dart';
import '../../../../core/error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../../../privacy_laws/domain/entities/laws.dart';
import '../../../privacy_laws/domain/repos/privacy_laws_repo.dart';

class LoadPrivacyLaws implements UseCase<List<Laws>, LoginUser> {
  final PrivacyLawsRepo privacyLawsRepo;

  LoadPrivacyLaws({@required this.privacyLawsRepo});

  @override
  Future<Either<Faliure, List<Laws>>> call(LoginUser user) async{
    return await this.privacyLawsRepo.loadPrivacyLaws(user);
  }
}
