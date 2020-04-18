import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:sieve_data_privacy_app/core/Usecase/use_case.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/features/login_screen/domain/entities/login_user.dart';
import 'package:sieve_data_privacy_app/features/privacy_news/domain/entities/news.dart';
import 'package:sieve_data_privacy_app/features/privacy_news/domain/repos/privacy_news_repo.dart';

class LoadPrivacyNews implements UseCase<List<News>, LoginUser> {
  final PrivacyNewsRepo privacyNewsRepo;

  LoadPrivacyNews({@required this.privacyNewsRepo});

  @override
  Future<Either<Faliure, List<News>>> call(LoginUser user) async{
    return await this.privacyNewsRepo.loadPrivacyNews(user);
  }
}
