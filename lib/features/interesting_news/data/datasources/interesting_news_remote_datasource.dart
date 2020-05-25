import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../core/Constants/key.dart';
import '../../../../core/error/exceptions.dart';
import '../models/news_model.dart';

abstract class InterestingNewsRemoteDatasource {
  /// Calls the api/user/login endpoint
  ///
  /// Throws a [ServerException] for all error codes.
  Future<List<NewsModel>> loadInterestingNews();
}

class InterestingNewsRemoteDatasourceImpl
    implements InterestingNewsRemoteDatasource {
  final http.Client httpClient;

  InterestingNewsRemoteDatasourceImpl({@required this.httpClient});

  @override
  Future<List<NewsModel>> loadInterestingNews() async {
    try {
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
        return NewsModel.fromJsonList(json.decode(response.body));
      }
    } catch (e) {
      print(e);
      throw ServerException();
    }
  }
}
