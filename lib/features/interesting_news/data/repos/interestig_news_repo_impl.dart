import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Platform/network_info.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';

import '../../domain/entities/news.dart';
import '../../domain/repos/interesting_news_repo.dart';
import '../datasources/interesting_news_remote_datasource.dart';

class InterestingNewsRepoImpl implements InterestingNewsRepo{

  final NetworkInfo networkInfo;
  final InterestingNewsRemoteDatasource interestingNewsRemoteDatasource;

  InterestingNewsRepoImpl({@required this.networkInfo, @required this.interestingNewsRemoteDatasource});

  @override
  Future<Either<Faliure, List<News>>> loadInterestingNews(LoginUser user) async {
    if (await networkInfo.isConnected) {
      try {
        final finalNews = await interestingNewsRemoteDatasource.loadInterestingNews();
        //await Future.delayed(Duration(seconds: 3));
        return Right(finalNews);
      } on ServerException {
        return (Left(ServerFaliure()));
      }
    } else {
      return Left(InternetConnectionFaliure());
    }
  }



}