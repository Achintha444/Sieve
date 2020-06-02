import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Platform/network_info.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/entities/tips.dart';
import '../../domain/repos/privacy_tips_repo.dart';
import '../datasources/privacy_tips_remote_datasource.dart';

class PrivacyTipsRepoImpl implements PrivacyTipsRepo{

  final NetworkInfo networkInfo;
  final PrivacyTipsRemoteDatasource privacyTipsRemoteDatasource;

  PrivacyTipsRepoImpl({@required this.networkInfo, @required this.privacyTipsRemoteDatasource});

  @override
  Future<Either<Faliure, List<Tips>>> loadPrivacyTips(LoginUser user) async {
     if (await networkInfo.isConnected) {
      try {
        final finalTips = await privacyTipsRemoteDatasource.loadPrivacyTips();
        //await Future.delayed(Duration(seconds: 3));
        return Right(finalTips);
      } on ServerException {
        return (Left(ServerFaliure()));
      } 
    } else {
      return Left(InternetConnectionFaliure());
    }
  }
  
}