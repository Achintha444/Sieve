import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Platform/network_info.dart';
import '../../../../core/error/Faliure.dart';
import '../../../../core/error/exceptions.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/entities/laws.dart';
import '../../domain/repos/privacy_laws_repo.dart';
import '../datasources/privacy_laws_remote_datasource.dart';

class PrivacyLawsRepoImpl implements PrivacyLawsRepo{

  final NetworkInfo networkInfo;
  final PrivacyLawsRemoteDatasource privacyLawsRemoteDatasource;

  PrivacyLawsRepoImpl({@required this.networkInfo, @required this.privacyLawsRemoteDatasource});

  @override
  Future<Either<Faliure, List<Laws>>> loadPrivacyLaws(LoginUser user) async {
     if (await networkInfo.isConnected) {
      try {
        final finalLaws = await privacyLawsRemoteDatasource.loadPrivacyLaws();
        //await Future.delayed(Duration(seconds: 3));
        return Right(finalLaws);
      } on ServerException {
        return (Left(ServerFaliure()));
      } 
    } else {
      return Left(InternetConnectionFaliure());
    }
  }
  
}