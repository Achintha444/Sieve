import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../core/Constants/key.dart';
import '../../../../core/error/exceptions.dart';
import '../models/categories_model.dart';

abstract class CategoriesRemoteDatasource {
  /// Calls the api/user/login endpoint
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<CategoriesModel>> loadCategories();
}

class CategoriesRemoteDatasourceImpl
    implements CategoriesRemoteDatasource {
  final http.Client httpClient;

  CategoriesRemoteDatasourceImpl({@required this.httpClient});

  @override
  Future<List<CategoriesModel>> loadCategories() async {
    final response =
        await httpClient.post(API_URL + "/interesting_news/view_all");
    if (response.statusCode != 200) {
      throw ServerException();
      // final error = json.decode(response.body);
      // if(error['serverError']==true){
      //   throw ServerException();
      // }else{
      //   throw InvalidInputException();
      // }
    } else {
      print(json.decode(response.body));
      return CategoriesModel.fromJsonList(json.decode(response.body));
    }
  }
}
