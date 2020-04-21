import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Usecase/use_case.dart';
import '../../../../core/error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../entities/news.dart';
import '../repos/interesting_news_repo.dart';

class LoadInterestingNews implements UseCase<List<News>,LoginUser>{

  final InterestingNewsRepo interestingNewsRepo;

  LoadInterestingNews({@required this.interestingNewsRepo});


  @override
  Future<Either<Faliure, List<News>>> call(LoginUser user) async {
    return await this.interestingNewsRepo.loadInterestingNews(user) ;
  }

}