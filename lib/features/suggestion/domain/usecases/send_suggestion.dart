import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

import '../../../../core/Entities/empty_entity.dart';
import '../../../../core/Usecase/use_case.dart';
import '../../../../core/error/Faliure.dart';
import '../repos/suggestion_repo.dart';

class SendSuggestion implements UseCase<EmptyEntity, List<dynamic>> {
  final SuggestionRepo suggestionRepo;

  SendSuggestion({@required this.suggestionRepo});

  //* var params = [user,suggestion]
  //* params[0] == user
  //* params[1] == suggestion

  @override
  Future<Either<Faliure, EmptyEntity>> call(List params) async{
    return await this.suggestionRepo.sendSuggestion(params[0], params[1]);
  }
}
