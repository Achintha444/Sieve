import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../core/Constants/key.dart';
import '../../../../core/Entities/empty_entity.dart';
import '../../../../core/error/exceptions.dart';
import '../../../login_screen/domain/entities/login_user.dart';

abstract class SuggestionRemoteDataSource {
  /// calls api/suggestion/insert endpoint
  ///
  /// Throws a [ServerException] for all error codes
  Future<EmptyEntity> insertSuggestion(LoginUser user, String suggestion);
}

class SuggestionRemoteDataSourceImpl implements SuggestionRemoteDataSource {
  final http.Client httpClient;

  SuggestionRemoteDataSourceImpl({@required this.httpClient});

  @override
  Future<EmptyEntity> insertSuggestion(LoginUser user, String suggestion) async {
    final response = await httpClient.post(API_URL + "/suggestion/insert",
        body: {'userId': user.getId, 'suggestion': suggestion});
        print('suggestion snt');
    if (response.statusCode != 200) {
      final error = json.decode(response.body);
      if(error['serverError']==true){
        throw ServerException();
      }else{
        throw InvalidInputException();
      }
    } else {
      return EmptyEntity();
    }
  }
}
