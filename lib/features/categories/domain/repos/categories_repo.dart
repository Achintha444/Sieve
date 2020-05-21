import 'package:dartz/dartz.dart';

import '../../../../core/error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../entities/categories.dart';

abstract class CategoriesRepo {
  Future <Either<Faliure,List<Categories>>> loadCategories(LoginUser user);
}