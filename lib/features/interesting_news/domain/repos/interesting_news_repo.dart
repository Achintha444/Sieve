import 'package:dartz/dartz.dart';

import '../../../../core/error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../entities/news.dart';

abstract class InterestingNewsRepo {
  Future <Either<Faliure,List<News>>> loadInterestingNews(LoginUser user);
}