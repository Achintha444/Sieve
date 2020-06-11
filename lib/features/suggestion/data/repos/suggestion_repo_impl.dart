import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:sieve_data_privacy_app/features/suggestion/data/datasources/suggestion_remote_datasource.dart';

import '../../../../core/Entities/empty_entity.dart';
import '../../../../core/Platform/network_info.dart';
import '../../../../core/error/Faliure.dart';
import '../../../../core/error/exceptions.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../../domain/repos/suggestion_repo.dart';

class SuggestionRepoImpl implements SuggestionRepo{

  final NetworkInfo networkInfo;
  final SuggestionRemoteDataSource suggestionRemoteDataSource;

  SuggestionRepoImpl({@required this.networkInfo, @required this.suggestionRemoteDataSource});

  @override
  Future<Either<Faliure, EmptyEntity>> sendSuggestion(LoginUser user, String suggestion) async {
    if (await networkInfo.isConnected) {
      try {
        final response =
            await suggestionRemoteDataSource.insertSuggestion(user, suggestion);
        //await Future.delayed(Duration(seconds: 2));
        return Right(response);
      } on ServerException {
        return (Left(ServerFaliure()));
      } on InvalidInputException {
        return (Left(InvalidInputFaliure()));
      } 
    } else {
      return Left(InternetConnectionFaliure());
    }
  }
  
}