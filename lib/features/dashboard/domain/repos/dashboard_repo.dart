import 'package:dartz/dartz.dart';

import '../../../../core/error/Faliure.dart';
import '../../../login_screen/domain/entities/login_user.dart';
import '../entities/dapp.dart';

abstract class DashboardRepo {
  Future<Either<Faliure, List<Dapp>>> loadDashboard(LoginUser user);
}