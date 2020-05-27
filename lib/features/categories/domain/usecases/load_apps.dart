import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Usecase/use_case.dart';
import '../../../../core/error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../entities/apps.dart';
import '../repos/apps_repo.dart';

class LoadApps implements UseCase<List<App>, List<dynamic>>{

  final AppsRepo appsRepo;

  LoadApps({@required this.appsRepo});


  @override
  Future<Either<Faliure, List<App>>> call(List params) async {
    return await this.appsRepo.loadApps(params[0], params[1]) ;
  }

}