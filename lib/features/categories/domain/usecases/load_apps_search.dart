import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Usecase/use_case.dart';
import '../../../../core/error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../entities/apps.dart';
import '../repos/apps_repo.dart';

class LoadAppsSearch implements UseCase<List<App>, LoginUser> {
  final AppsRepo appsRepo;

  LoadAppsSearch({@required this.appsRepo});

  @override
  Future<Either<Faliure, List<App>>> call(LoginUser user) async {
    return await this.appsRepo.loadAppsSearch(user);
  }
}
