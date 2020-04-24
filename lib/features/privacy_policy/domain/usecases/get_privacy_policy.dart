import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Usecase/use_case.dart';
import '../../../../core/error/Faliure.dart';
import '../entities/privacy_policy.dart';
import '../repos/privacy_policy_repo.dart';

class GetPriacyPolicy implements UseCase<PrivacyPolicy, List<dynamic>> {
  final PrivacyPolicyRepo privacyPolicyRepo;

  GetPriacyPolicy({@required this.privacyPolicyRepo});

  // params[0] = LoginUser user,
  // params[1] = String id

  @override
  Future<Either<Faliure, PrivacyPolicy>> call(List params) async{
    return await this.privacyPolicyRepo.getPrivacyPolicy(params[0], params[1]);
  }
}
