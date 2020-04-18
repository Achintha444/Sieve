import 'package:dartz/dartz.dart';

import '../../../../core/error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../entities/news.dart';

abstract class PrivacyNewsRepo{
  Future <Either<Faliure,List<News>>> loadPrivacyNews(LoginUser user);
  
}