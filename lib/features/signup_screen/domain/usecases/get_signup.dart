import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:sieve_data_privacy_app/core/Entities/empty_entity.dart';
import 'package:sieve_data_privacy_app/core/Usecase/use_case.dart';
import 'package:sieve_data_privacy_app/core/error/Faliure.dart';
import 'package:sieve_data_privacy_app/features/signup_screen/domain/repos/signup_repo.dart';

class GetSignup extends UseCase<EmptyEntity, List<String>> {
  final SignupRepo signupRepo;

  GetSignup({@required this.signupRepo});

  //* var signupDetails = [email,password]
  //* signupDetails[0] == username
  //* signupDetails[1] == password

  @override
  Future<Either<Faliure, EmptyEntity>> call(List<String> signupDetails) async {
    return await this.signupRepo.getSignup(signupDetails[0], signupDetails[1]);
  }
}
