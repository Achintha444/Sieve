import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Platform/network_info.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';

import '../../domain/entities/apps.dart';
import '../../domain/repos/apps_repo.dart';
import '../datasources/apps_remote_datasource.dart';

class AppsRepoImpl implements AppsRepo{

  final NetworkInfo networkInfo;
  final AppsRemoteDatasource appsRemoteDatasource;

  AppsRepoImpl({@required this.networkInfo, @required this.appsRemoteDatasource});

  @override
  Future<Either<Faliure, List<Apps>>> loadApps(LoginUser user, int categoryId) async {
    if (await networkInfo.isConnected) {
      try {
        final finalApps = await appsRemoteDatasource.loadApps(categoryId);
        await Future.delayed(Duration(seconds: 3));
        return Right(finalApps);
      } on ServerException {
        return (Left(ServerFaliure()));
      }
    } else {
      return Left(InternetConnectionFaliure());
    }
  }



}