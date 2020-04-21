import 'package:dartz/dartz.dart';

import '../../../../core/Entities/empty_entity.dart';
import '../../../../core/error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';

abstract class SuggestionRepo{
  Future<Either<Faliure,EmptyEntity>> sendSuggestion(LoginUser user, String suggestion);
}