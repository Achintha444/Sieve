import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import '../../../../core/Entities/empty_entity.dart';
import '../../../../core/Usecase/use_case.dart';
import '../../../../core/error/Faliure.dart';
import '../repos/signup_screen_repo.dart';

class GetSignup extends UseCase<EmptyEntity, List<String>> {
  final SignupScreenRepo signupRepo;

  GetSignup({@required this.signupRepo});

  //* var signupDetails = [email,password]
  //* signupDetails[0] == username
  //* signupDetails[1] == password

  @override
  Future<Either<Faliure, EmptyEntity>> call(List<String> signupDetails) async {
    return await this.signupRepo.getSignup(signupDetails[0], signupDetails[1]);
  }
}
