import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Usecase/use_case.dart';
import '../../../../core/error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../../../dashboard/domain/entities/dapp.dart';
import '../../../dashboard/domain/repos/dashboard_repo.dart';

class LoadDashboard implements UseCase<List<Dapp>, LoginUser> {
  final DashboardRepo dashboardRepo;

  LoadDashboard({@required this.dashboardRepo});

  @override
  Future<Either<Faliure, List<Dapp>>> call(LoginUser user) async{
    return await this.dashboardRepo.loadDashboard(user);

  }
}