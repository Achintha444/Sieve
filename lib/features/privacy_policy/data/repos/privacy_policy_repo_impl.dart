import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/core/error/Exceptions.dart';
import 'package:sieve_data_privacy_app/core/Platform/network_info.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/data/datasources/privacy_policy_remote_datasource.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/domain/entities/privacy_policy.dart';
import 'package:sieve_data_privacy_app/features/privacy_policy/domain/repos/privacy_policy_repo.dart';

class PrivacyPolicyRepoImpl implements PrivacyPolicyRepo {
  final NetworkInfo networkInfo;
  final PrivacyPolicyRemoteDatasource privacyPolicyRemoteDatasource;

  PrivacyPolicyRepoImpl(
      {@required this.networkInfo,
      @required this.privacyPolicyRemoteDatasource});

  @override
  Future<Either<Faliure, PrivacyPolicy>> getPrivacyPolicy(
      String id, LoginUser user) async {
    if (await networkInfo.isConnected) {
      try {
        final finalPolicy =
            await privacyPolicyRemoteDatasource.loadPrivacyPolicy(id);
        await Future.delayed(Duration(seconds: 3));
        return Right(finalPolicy);
      } on ServerException {
        return (Left(ServerFaliure()));
      }
    } else {
      return Left(InternetConnectionFaliure());
    }
  }
}
