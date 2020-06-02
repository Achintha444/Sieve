import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Platform/network_info.dart';
import '../../../../core/error/Faliure.dart';
import '../../../../core/error/exceptions.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/entities/dapp.dart';
import '../../domain/repos/dashboard_repo.dart';
import '../datasources/dashboard_remote_datasource.dart';


class DashboardRepoImpl implements DashboardRepo{

  final NetworkInfo networkInfo;
  final DashboardRemoteDatasource dashboardRemoteDatasource;

  DashboardRepoImpl({@required this.networkInfo, @required this.dashboardRemoteDatasource});

  @override
  Future<Either<Faliure, List<Dapp>>> loadDashboard(LoginUser user) async {
    if (await networkInfo.isConnected) {
      try {
        final finalDapp = await dashboardRemoteDatasource.loadDashboard();
        //await Future.delayed(Duration(seconds: 3));
        return Right(finalDapp);
      } on ServerException {
        return (Left(ServerFaliure()));
      }
    } else {
      return Left(InternetConnectionFaliure());
    }
  }

}